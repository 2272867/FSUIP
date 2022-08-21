//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 1.08.22.
//

import SwiftUI

struct ContentView: View {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    var body: some View {
        VStack {
            MainView()
        }
    }
=======
=======
    
    @AppStorage("login_Status") var status = false
    
    @StateObject var model = CredentialsModel()
>>>>>>> Stashed changes

    @State var tabBarPages: [TabBarPage] = [
        TabBarPage(page: MainView(), icon: "house", fillColor: .purple),
        TabBarPage(page: ProductsBookmarkView(), icon: "heart", fillColor: .red),
        TabBarPage(page: ShopingCartView(), icon: "cart", fillColor: .orange),
        TabBarPage(page: ProfileView(), icon: "person", fillColor: .blue)
    ]
    
        var body: some View {
<<<<<<< Updated upstream
            TabBarView(pages: $tabBarPages)
        }
>>>>>>> Stashed changes
=======
            if status {
                
                TabBarView(pages: $tabBarPages)
                } else {
                    
                    LoginView(model: model)
                }
                
            }
            
>>>>>>> Stashed changes
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
