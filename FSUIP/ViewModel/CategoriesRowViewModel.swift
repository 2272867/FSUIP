//
//  CategoriesRowViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 30.08.22.
//

import SwiftUI

struct CategoriesRowViewModel: View {
    
    var catrgory: CategoryModel
    
//    var categories = [
//        CategoryRowModel(title: "Собаки", image: Image("category_1")),
//        CategoryRowModel(title: "Кошки", image: Image("category_2")),
//        CategoryRowModel(title: "Грызуны", image: Image("category_3")),
//        CategoryRowModel(title: "Рыбки", image: Image("category_5"))
//
//    ]
    
//    private func categoryRowView(category: CategoryRowModel) -> some View {
//        VStack {
//            NavigationLink(destination: ProductsRowView()) {
//                VStack {
//                    HStack {
//                        category.image
//                            .resizable()
//                            .frame(width: 32, height: 32)
//                            .invertOnDarkTheme()
//                        Spacer()
//                            .frame(width: 24)
//                        Text(category.title)
//                            .font(.system(size: 16))
//                            .foregroundColor(Color.black)
//                            .invertOnDarkTheme()
//                        Spacer()
//                        Image(systemName: "chevron.forward")
//                            .frame(width: 20, height: 10)
//                            .foregroundColor(Color.black)
//                            .invertOnDarkTheme()
//                        Spacer()
//                            .frame(width: 20)
//                    }
//                    .padding()
//                    Divider()
//                        .background(Color.black )
//                        .padding(.horizontal, 16)
//                        .foregroundColor(Color.black)
//                        .invertOnDarkTheme()
//                    
//                }
//            }.navigationBarHidden(true).navigationTitle("")
//           // Spacer()
//        }
//        }
    
    var body: some View {
//        ForEach(0..<categories.count) { category in
//            categoryRowView(category: category)
//        }
        VStack {
            NavigationLink(destination:
                            AnyView(_fromValue: catrgory.presentPage)
 //                          ProductsRowView()
                           ,label: {
                VStack {
                    HStack {
                        catrgory.image
                            .resizable()
                            .frame(width: 32, height: 32)
                            .invertOnDarkTheme()
                        Spacer()
                            .frame(width: 24)
                        Text(catrgory.title)
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .invertOnDarkTheme()
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .frame(width: 20, height: 10)
                            .foregroundColor(Color.black)
                            .invertOnDarkTheme()
                        Spacer()
                            .frame(width: 20)
                    }
                    .padding()
                    Divider()
                        .background(Color.black )
                        .padding(.horizontal, 16)
                        .foregroundColor(Color.black)
                        .invertOnDarkTheme()

                }
            }).navigationBarHidden(true).navigationTitle("")
            Spacer()
        }
        
    }
}

//struct CategoriesRowViewModel_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CategoriesRowViewModel()
//    }
//}
