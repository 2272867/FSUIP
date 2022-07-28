//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.07.22.
//
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var selectedIndex: Int = 0
    @State private var showSearchBar = false
    @State private var serchText = ""
    @State private var isSearching = false
    @State private var textFieldId: String = UUID().uuidString
    private let promotedCtegories = ["Акции", "Хит продаж", "Новинки"]
    @State private var categories = ["Собаки", "Кошки", "Грызуны", "Птицы", "Рыбки", "Другие"]
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    AppHeaderBar(showSearchBar: $showSearchBar)
                        
                    SearchBarView(serchText: $serchText, isSearching: $isSearching, showSearchBar: $showSearchBar, textFieldId: $textFieldId)

                    BannerImageView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< promotedCtegories.count, id: \.self) { i in
                                PromotedCategoriesView(isActive: i == selectedIndex, text: promotedCtegories[i])
                                    .onTapGesture {
                                        selectedIndex =  i
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    Spacer()
                        .frame(width: 32)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { i in
                                ProductCardView(image: Image("test_\(i + 1)"))
                            }
                        }
                    }
                    
                    
                    HStack {
                        VStack {
                            Spacer(minLength: 40)
                            Text("Категории")
                                .font(.system(size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 18)
                            Spacer(minLength: 1)
                            Divider()
                                .background(Color.black)
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                CategoriesView(text: categories[i], image: Image("category_\(i + 1)"))
                            }
                        }
                    }
                    
                    VStack {
                        Spacer(minLength: 40)
                        Text("Популярные бренды")
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 18)
                        Divider()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 6, id:\.self) {i in
                                    PopularBrandsView(image: Image("popularBrand_\(i + 1)"))
                                    }
                                    
                                }
                            }
                        }

                }
            }
        }
        .padding(.top, 1)
        .onTapGesture {
        action: do { textFieldId = UUID().uuidString}}
        .onLongPressGesture {
        action: do { textFieldId = UUID().uuidString}}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppHeaderBar: View {
    @Binding var showSearchBar: Bool
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: 56)
            
            HStack {
                
                Button(action: {}) {
                    Image("petShopLogo")
                        .frame(width: 68, height: 40)
                }
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        withAnimation {
                        self.showSearchBar.toggle()
                        }
                    }) {
                        Image("findImage")
                            .frame(width: 24, height: 24)
                    }
                    Button(action: {}) {
                        Image("bookmarkImage")
                            .frame(width: 24, height: 24)
                    }
                    Button(action: {}) {
                        Image("shoppingCart")
                            .frame(width: 24, height: 24)
                    }
                    Button(action: {}) {
                        Image("profileImage")
                            .frame(width: 24, height: 24)
                    }
                }
                
            }
            .padding(.horizontal)
        }
    }
}

struct SearchBarView: View {
    @Binding var serchText: String
    @Binding var isSearching: Bool
    @Binding var showSearchBar: Bool
    @Binding var textFieldId: String
    var body: some View {
        
        if showSearchBar {
            ScrollView {
                HStack {
                    TextField("Что ищем?", text: $serchText)
                        .padding(.leading, 30)
                        .cornerRadius(999)
                        .id(textFieldId)
                }
              
                .padding(12)
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.horizontal)
                .shadow(color: .gray, radius: 10)
                .foregroundColor(.black)
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching {
                            Button(action: {serchText = "" }, label: {
                                Image(systemName: "xmark.circle.fill")
                            })
                        }
                    }.padding(.horizontal, 32)
                        .foregroundColor(.black)
                    
                )
                
                ForEach((0 ..< 20).filter({ "\($0)".contains(serchText)
                    // || serchText.isEmpty
                    
                }), id: \.self) { num in
                    HStack {
                        Text("\(num)")
                        Spacer()
                        
                    }
                    .padding()
                    Divider()
                        .background(Color.black)
                }
            }
        }
    }
}

struct BannerImageView: View {
    var body: some View {
            Image("petShopbaner")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 144)
        Spacer(minLength: 32)
    }
}

struct PromotedCategoriesView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color.black: Color.black.opacity(0.5))
                
                if (isActive) {
                    Rectangle().fill(Color.purple)
                    .frame(height: 3)
                }
            }
            .padding(.leading)
        }
    }
}

struct ProductCardView: View {
    let image: Image
    var body: some View {
        VStack(spacing: 14) {
            Text("Hill's Prescription Diet Feline Metabolic")
                .font(.system(size: 16))
                .lineLimit(2)
            Text("Диета для кошек с избыточным весом")
                .font(.system(size: 14))
                .lineLimit(2)
            Text("27.55 руб.")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.purple)
            Text("39.35 руб.")
                .strikethrough()
            image
                .resizable()
                .frame(width: 160, height: 160)
                .cornerRadius(20.0)
            Button(action: {}) {
                Text("Добавить в корзину")
                    .foregroundColor(.black)
            }
            .padding()
            .background(.yellow)
            .cornerRadius(100)
            .frame(width: 311, height: 48)
        }
        .padding()
        .frame(width: 343, height: 374)
    }
    
}

struct CategoriesView: View {
    let text: String
    let image: Image
    var body: some View {
            HStack {
                image
                    .frame(width: 32, height: 32)
                Text(text)
                    .font(.system(size: 16))
                Spacer()
                Image(systemName: "chevron.forward")
                    .frame(width: 20, height: 10)
            }
            .padding()
            Divider()
            .background(Color.black)
    }
}

struct PopularBrandsView: View {
    let image: Image
    var body: some View {
            image
            .resizable()
            .frame(width: 91, height: 50)
    }
}
