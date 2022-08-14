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
    @StateObject var authentication = Authentication()
    var body: some Scene {
       // @State var showSearchBar = false
      //  @State var isShowingProfileView = false
        WindowGroup {
<<<<<<< Updated upstream
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
=======
            if authentication.isValidated {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
            
>>>>>>> Stashed changes
        }
    }
}
