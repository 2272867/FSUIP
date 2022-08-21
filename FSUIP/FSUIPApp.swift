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
   // @StateObject var authentication = Authentication()
   // @ObservedObject private var model: CredentialsModel
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
   // @AppStorage("login_Status") var status = false
    
    var body: some Scene {
        WindowGroup {
          //  if status {
            ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        //    } else {
         //       LoginView()
                    
          //  }

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
