//
//  NaviBarView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 6.08.22.
//

import SwiftUI

struct TabBarViewModel: View {
    
    @State var selectedTab = "house"
    @Binding var pages: [TabBarPageModel]
    init(pages: Binding<[TabBarPageModel]>) {
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


