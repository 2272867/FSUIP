//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 1.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("login_Status") var status = false
    
    @StateObject var model = CredentialsModel()

    @State var tabBarPages: [TabBarPageModel] = [
        TabBarPageModel(page: MainView(), icon: "house", fillColor: .purple),
        TabBarPageModel(page: ProductsBookmarkView(), icon: "heart", fillColor: .red),
        TabBarPageModel(page: ShopingCartView(), icon: "cart", fillColor: .orange),
        TabBarPageModel(page: ProfileView(), icon: "person", fillColor: .blue)]
    
        var body: some View {
            if status {
                
                TabBarView(pages: $tabBarPages)
                
                } else {
                    
                    LoginView(model: model)
                }
                
            }
            
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
