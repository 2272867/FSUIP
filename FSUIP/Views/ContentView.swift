//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 1.08.22.
//

import SwiftUI

struct ContentView: View {
<<<<<<< Updated upstream
    var body: some View {
        VStack {
            MainView()
        }
    }
=======

    @State var tabBarPages: [TabBarPage] = [
        TabBarPage(page: MainView(), icon: "house", fillColor: .purple),
        TabBarPage(page: ProductsBookmarkView(), icon: "heart", fillColor: .red),
        TabBarPage(page: ShopingCartView(), icon: "cart", fillColor: .orange),
        TabBarPage(page: ProfileView(), icon: "person", fillColor: .blue)
    ]
        var body: some View {
            TabBarView(pages: $tabBarPages)
        }
>>>>>>> Stashed changes
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
