//
//  FSUIPApp.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.07.22.
//

import SwiftUI

@main
struct FSUIPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}


