//
//  ContentView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.07.22.
//


import SwiftUI
import CoreData

struct MainView: View {
   // @State private var isShowingProfileView = false
    @State private var selectedCategory: Int = 0
    @State private var serchText = ""
    @State private var isSearching = false

    private let promotedCtegories = ["Акции", "Хит продаж", "Новинки"]
    private var categories = [
        CatrgoryModel(title: "Собаки", image: Image("category_1")),
        CatrgoryModel(title: "Кошки", image: Image("category_2")),
        CatrgoryModel(title: "Грызуны", image: Image("category_3")),
        CatrgoryModel(title: "Птицы", image: Image("category_4")),
        CatrgoryModel(title: "Рыбки", image: Image("category_5")),
        CatrgoryModel(title: "Другие", image: Image("category_6"))]
    
    var body: some View {
            VStack {
                SearchBarView(serchText: $serchText, isSearching: $isSearching)
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        
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
                        
                        Spacer()
                            .frame(height: 20)
                        

                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< promotedCtegories.count, id: \.self) { i in
                                        PromotedCategoriesView(isActive: i == selectedCategory, text: promotedCtegories[i])
                                            .onTapGesture {
                                                selectedCategory =  i
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
 //                               ForEach(0 ..< categories.count, id: \.self) { i in
//                                    CategoriesRow(text: categories[i], image: Image("category_\(i + 1)"), catrgory: <#CatrgoryModel#>)
//                                }
                                ForEach(categories) { category in
                                    CategoriesRowViewModel( catrgory: category)

                                }
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 70)
                }
            }
            .padding(.top, 1)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
            MainView()
    }
}

struct SearchBarView: View {
    @Binding var serchText: String
    @Binding var isSearching: Bool

    var body: some View {
        
          //  ScrollView {
                HStack {
                    TextField("Что ищем?", text: $serchText)
                        .padding(.leading, 29)
                }
                .cornerRadius(20)
                .padding(10)
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: Color.purple.opacity(0.5), radius: 4, x: 6, y: 3)
                .frame(width: nil, height: 60)
                
                .onTapGesture(perform: { isSearching = true })
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
          //  }
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
                        .foregroundColor(isActive ? Color.black : Color.black.opacity(0.5))
                    
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
                .shadow(color: Color.purple.opacity(0.5), radius: 5, x: 9, y: 9)
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
                                .foregroundColor(.purple.opacity(0.9))
                            Text("39.35 руб.")
                                .strikethrough()
                                .foregroundColor(.black.opacity(0.7))
                        }
                    }
                    .padding(.vertical,5)
                }
                .padding(.horizontal, 7)
                
                Spacer()
                    .frame(height: 17)
                
                Button(action: {}) {
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 170 , height: 12)
                    
                }
                .padding()
                .background(.purple.opacity(0.8))
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

struct CategoriesRow: View {
    
    var catrgory: CatrgoryModel
    
    var body: some View {
        Button {
       //some action
        } label: {
            VStack {
                HStack {
                    catrgory.image
                        .frame(width: 32, height: 32)
                    Spacer()
                        .frame(width: 24)
                    Text(catrgory.title)
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
