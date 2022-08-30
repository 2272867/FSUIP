//
//  CategoriesRowViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 30.08.22.
//

import SwiftUI

struct CategoriesRowViewModel: View {
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
