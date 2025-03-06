//
//  PokeGoDexApp.swift
//  PokeGoDex
//
//  Created by Andersson on 5/03/25.
//

import SwiftUI

@main
struct PokeGoDexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
