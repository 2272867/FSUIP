//
//  HeaderView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 1.08.22.
//

import SwiftUI

//struct HeaderView: View {
//    @Binding var showSearchBar = false
//    @Binding var isShowingProfileView = false
//    var body: some View {
//        ZStack {
//            NavigationLink(destination: ProfileView(), isActive: $isShowingProfileView) {ProfileView()}
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
//            
//            Color.yellow
//                .edgesIgnoringSafeArea(.all)
//                .frame(width: UIScreen.main.bounds.width, height: 56)
//            
//            HStack {
//                
//                Button(action: {}) {
//                    Image("petShopLogo")
//                        .frame(width: 68, height: 40)
//                }
//                
//                Spacer()
//                
//                HStack {
//                    
//                    Button(action: {
//                        withAnimation {
//                        self.showSearchBar.toggle()
//                        }
//                    }) {
//                        Image("findImage")
//                            .frame(width: 24, height: 24)
//                    }
//                    Button(action: {}) {
//                        Image("bookmarkImage")
//                            .frame(width: 24, height: 24)
//                    }
//                    Button(action: {}) {
//                        Image("shoppingCart")
//                            .frame(width: 24, height: 24)
//                    }
//                    Button(action: {
//                        self.isShowingProfileView = true
//                       
//                   // destination: ProfileView()
//                    }) {
//                        Image("profileImage")
//                            .frame(width: 24, height: 24)
//                    }
//                }
//                
//            }
//            .padding(.horizontal)
//        }
//    }
//}


//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView()
//    }
//}
