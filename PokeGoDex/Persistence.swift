//
//  Persistence.swift
//  PokeGoDex
//
//  Created by Andersson on 5/03/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let newPokemon = Pokemon(context: viewContext)
        newPokemon.id = 1
        newPokemon.name = "bulbasaur"
        newPokemon.types = ["grass", "poison"]
        newPokemon.hp = 45
        newPokemon.attack = 49
        newPokemon.defense = 49
        newPokemon.specialAttack = 65
        newPokemon.specialDefense = 65
        newPokemon.speed = 45
        newPokemon.sprite = URL(string: "https://raw.githubusercontent.com/pokeapi/pokeapi/master/sprites/pokemon/1.png")
        newPokemon.shiny = URL(string: "https://raw.githubusercontent.com/pokeapi/pokeapi/master/sprites/pokemon/shiny/1.png")
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PokeGoDex")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
