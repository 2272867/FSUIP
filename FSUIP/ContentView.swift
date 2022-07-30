//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.07.22.
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
                    

                    VStack {
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
                            .padding(.horizontal, 16)
                    }
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("test_\(i + 1)"))
                                }
                            }
                        }
                    }

                    HStack {
                        VStack {
                            Text("Категории")
                                .font(.system(size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 18)
                            Spacer()
                                .frame(width: 1)
                            Divider()
                                .background(Color.black)
                                .padding(.horizontal, 16)
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                CategoriesView(text: categories[i], image: Image("category_\(i + 1)"))
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    VStack {
                        Text("Популярные бренды")
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 18)
                        Divider()
                            .padding(.horizontal, 16)
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
        Group {
            ContentView()
            ContentView()
        }
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
        Spacer()
            .frame(width: 32)
    }
}

struct PromotedCategoriesView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        HStack {
            Button {
                //some action
            } label: {
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
}

struct ProductCardView: View {
    let image: Image
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40).fill(.white)
                .shadow(color: .gray, radius: 5)
                .background(Color.white)
                .frame(width: UIScreen.main.bounds.width - 28, height: 230)
            VStack {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .frame(width: 105, height: 140)
                        .cornerRadius(20.0)
                        .background(Color.clear)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 17)
                        Text("Hill's Prescription Diet Feline Metabolic")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .lineLimit(3)
                        Spacer()
                            .frame(height: 7)
                        Text("Диета для кошек с избыточным весом")
                            .font(.system(size: 15))
                            .lineLimit(2)
                        
                        Spacer()
                            .frame(height: 17)
                        
                        HStack {
                            Text("27.55 руб.")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                            Text("39.35 руб.")
                                .strikethrough()
                        }
                    }
                    .padding(.vertical,5)
                }
                .padding(.horizontal, 7)
                
                Spacer()
                    .frame(height: 17)
                
                Button(action: {}) {
                    Text("Добавить в корзину")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 170 , height: 12)
                }
                .padding()
                .background(.yellow)
                .cornerRadius(20)
                .frame(width: 150, height: 20)
                
                Spacer()
                    .frame(height: 14)
            }
        }
        .padding()
        .padding(.horizontal, 16)
        .frame(width: UIScreen.main.bounds.width - 20, height: 270)
    }
    
}

struct CategoriesView: View {
    let text: String
    let image: Image
    var body: some View {
        Button {
       //some action
        } label: {
            VStack {
                HStack {
                    image
                        .frame(width: 32, height: 32)
                    Spacer()
                        .frame(width: 24)
                    Text(text)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .frame(width: 20, height: 10)
                        .foregroundColor(.black)
                    Spacer()
                        .frame(width: 20)
                }
                .padding()
                Divider()
                    .background(Color.black )
                    .padding(.horizontal, 16)
                
            }
        }
    }
}

struct PopularBrandsView: View {
    let image: Image
    var body: some View {
        Button {
            //some action
        } label: {
            image
            .resizable()
            .frame(width: 91, height: 50)
        }


    }
}
