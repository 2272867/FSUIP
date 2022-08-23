//
//  AppUser.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 20.08.22.
//

import SwiftUI
<<<<<<< Updated upstream

struct AppUser: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppUser_Previews: PreviewProvider {
    static var previews: some View {
        AppUser()
    }
}
=======
import FirebaseFirestore
import Foundation
import FirebaseAuth

struct AppUser: Identifiable, Codable {
    var id: String?
    var username: String?
    var password: String?
    var userId: String?
    var email: String?
    var birthDay: Date
    var profileImage: Data?
    var locationAddress: String?
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email!, password: password!)
    }
}


>>>>>>> Stashed changes
