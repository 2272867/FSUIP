//
//  CatgoryView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 29.08.22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import SDWebImageSwiftUI

struct ProductsRowView: View {
    var filterAndNavibarTitle: String
    @ObservedObject var viewModel = ProductsViewModel()
    
        private func productRowView(product: ProductModel) -> some View {
            HStack {
                NavigationLink(destination: FullDetailsProductViewModel(product: product)) {
                    
                    VStack {
                        HStack {
                            AnimatedImage(url: URL(string: product.image)!)
                                .resizable()
                                .frame(width: 60, height: 100)
                                .invertOnDarkTheme()
                            Spacer()
                                .frame(width: 24)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(product.title)
                                    .font(.system(size: 16).bold())
                                    .foregroundColor(Color.black)
                                    .invertOnDarkTheme()
                                Text(product.description)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.black)
                                    .invertOnDarkTheme()
                            }
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
                    
                }.navigationTitle(filterAndNavibarTitle)
                }
            }
    
    var body: some View {
            ScrollView {
                ForEach(viewModel.products.filter{$0.category.contains(filterAndNavibarTitle)}) { product in
                    productRowView(product: product)
                    
                    //                        if self.isShowingProductDetails {
                    //
                    //                                    GeometryReader {_ in
                    //                                        FullDetailsProductViewModel()
                    //                                    }
                    //                                    .background(
                    //                                        Color.black.opacity(0.65)
                    //                                            .edgesIgnoringSafeArea(.all)
                    //                                            .onTapGesture {
                    //                                                withAnimation {
                    //                                                    isShowingProductDetails.toggle()
                    //                                                }
                    //                                            }
                    //                                    )
                    //                                }
                }
            }.onAppear() {
                print("Subscribing to data updates.")
                self.viewModel.subscribe() }
        
    }
}
//struct ProductsRowView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        ProductsRowView()
//    }
//}

