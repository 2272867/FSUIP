//
//  ProfileView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 31.07.22.
//

import SwiftUI

struct ProfileView: View {
<<<<<<< Updated upstream
 //   @Binding var showSearchBar: Bool
  //  @Binding var isShowingProfileView: Bool
=======
    @EnvironmentObject var authentication: Authentication
    @State private var isAnimating = false
    @State private var showProgress = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
        
    }
    
>>>>>>> Stashed changes
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
<<<<<<< Updated upstream
                    VStack{
                    //    AppHeaderBar(showSearchBar: $showSearchBar, isShowingProfileView: $isShowingProfileView)
                        Text("Hell")
=======
                    VStack {
                        Image("pepegaProfile")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                            .animation(self.isAnimating ? foreverAnimation : .default)
                            .onAppear { self.isAnimating = true }
                            .onDisappear { self.isAnimating = false }
                        Spacer()
                            .frame(height: 50)
                        Button("Выйди и зайди нормально!!!") {
                            authentication.updateValidation(success: false)
                        }
                        
>>>>>>> Stashed changes
                    }
                }
            }
        }
      //  .navigationBarHidden(true)
      //  .navigationBarBackButtonHidden(true)
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
