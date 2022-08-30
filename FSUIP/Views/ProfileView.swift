//
//  ProfileView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 31.07.22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("login_Status") var status = true
    @StateObject var model = CredentialsModel()
    @State private var isAnimating = false
    
    
    var body: some View {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("pepegaProfile")
                            .resizable()
                            .overlay(Circle().stroke(Color.purple, lineWidth: 5))
                            .shadow(radius: 10)
                            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2.2)
                            .scaledToFill()
                            .clipShape(Circle())

                        Spacer()
                            .frame(height: 200)
                        
                        Text("залогинился как \(Auth.auth().currentUser?.email ?? "")")
                        Spacer()
                        
                        Button("Выйди и зайди нормально!!!") {
                            model.logOut()
                        }
                        
                    }
                    
                }
                
            }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
