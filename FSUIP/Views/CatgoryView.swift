//
//  CatgoryView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 29.08.22.
//

import SwiftUI

struct CatgoryView: View {
    
    @State private var categories = ["Собаки", "Кошки", "Грызуны", "Птицы", "Рыбки", "Другие"]
    let category = [CatrgoryModel(title: "Собаки", image: Image("category_1")),
                     CatrgoryModel(title: "Кошки", image: Image("category_2")),
                     CatrgoryModel(title: "Грызуны", image: Image("category_3")),
                     CatrgoryModel(title: "Птицы", image: Image("category_4")),
                     CatrgoryModel(title: "Рыбки", image: Image("category_5")),
                     CatrgoryModel(title: "Другие", image: Image("category_6"))
    ]
    
    var body: some View {
        List(category) { categor in ExtractedView(catrgory: categor)}
        
        
    }
}
struct CatgoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        CatgoryView()
    }
}

struct ExtractedView: View {
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
//                Divider()
//                    .background(Color.black )
//                    .padding(.horizontal, 16)
//                    .frame(height: 1)
                
            }
        }
    }
}
