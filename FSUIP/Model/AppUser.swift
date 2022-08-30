//
//  AppUser.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 20.08.22.
//

import SwiftUI
import FirebaseFirestore
import Foundation
import FirebaseAuth

struct AppUser: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    var username: String?
    var password: String?
    var userId: String?
    var email: String?
    var birthDay: Date
    var profileImage: Data?
    var locationAddress: String?
    
}


