//
//  PaperdollApp.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/17/24.
//

import SwiftUI

@main
struct PaperdollApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
