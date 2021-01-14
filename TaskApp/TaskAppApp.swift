//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Michele on 13/01/21.
//

import SwiftUI

@main
struct TaskAppApp: App {
    let persistenceController = PersistenceController.shared
//    @Environment(\.managedObjectContext) var context 
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
