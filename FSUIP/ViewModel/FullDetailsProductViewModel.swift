//
//  FullDetailsProductViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 18.09.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct FullDetailsProductViewModel: View {
  //  @Binding var isShowingProductDetails: Bool
 // @ObservedObject var viewModel = ProductViewModel()
    var product: ProductModel
    
    var body: some View {

        VStack(alignment: .center) {
                    HStack {
                        AnimatedImage(url: URL(string: product.image)!)
                       // Image("test_1")
                            .resizable()
                            .frame(width: 100, height: 180)
                            .cornerRadius(20.0)
                            .background(Color.clear)
                        
                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(height: 17)
                            Text(product.title)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .lineLimit(3)
                            Spacer()
                                .frame(height: 7)
                            Text(product.description)
                                .font(.system(size: 15))
                                .lineLimit(6)
                            
                            Spacer()
                                .frame(height: 17)
                            
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.horizontal, 7)
                    
                    HStack {
                        Text("\(product.price) руб.")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.purple.opacity(0.9))
//                        Text("39.35 руб.")
//                            .strikethrough()
//                            .foregroundColor(.black.opacity(0.7))
//                            .invertOnDarkTheme()
                    }
                    Spacer()
                        .frame(height: 10)
            Text("\(product.productWeight)")
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "minus.circle")
                        }
                        Spacer()
                        
                        Text("1")
                        
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "plus.circle")
                        }
                        Spacer()
                    }
                    .padding()
                    ButtonForLoginScreensViewModel(text: "Dobavit v korzinu", action: {
                        
                    })
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.purple.opacity(0.5), radius: 5, x: 9, y: 9)
    }
}

//struct FullDetailsProductViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        FullDetailsProductViewModel()
//    }
//}
