//
//  NaviBarView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 6.08.22.
//

import SwiftUI

struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var fillColor: Color
}


struct TabBarView: View {

    @State var selectedTab = "house"
    @Binding var pages: [TabBarPage]
    init(pages: Binding<[TabBarPage]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem {
                            EmptyView()
                        }
                        .tag(item.icon)
                }
            }
            
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.icon
                    }) {
                        ZStack {
                            Image(systemName: self.selectedTab == item.icon ? item.icon + ".fill" : item.icon)
                                .renderingMode(.template)
                                .imageScale(.large)
                                .scaleEffect(self.selectedTab == item.icon ? 1.5 : 1.0)
                                .padding(5)
                                .foregroundColor(self.selectedTab == item.icon ? item.fillColor : .black.opacity(0.7))
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.4)) {
                                        selectedTab = item.icon
                                    }
                                }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .badge(5)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(color: Color.purple.opacity(0.5), radius: 8, x: 9, y: 9)
            .frame(width: nil, height: 60)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([
            TabBarPage(page: MainView(), icon: "house", fillColor: .purple),
            TabBarPage(page: LoginView(), icon: "heart", fillColor: .red),
            TabBarPage(page: ShopingCartView(), icon: "cart", fillColor: .green),
            TabBarPage(page: ProfileView(), icon: "person", fillColor: .blue)
        ]))
    }
}

