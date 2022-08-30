//
//  FSUIPApp.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.07.22.
//

import SwiftUI
import FirebaseCore

@main
struct FSUIPApp: App {
    let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class Delegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
