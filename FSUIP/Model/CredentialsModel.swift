//
//  CredentialsModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import Foundation
import FirebaseAuth
import SwiftUI

class CredentialsModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isSignU = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    
//    func encoded() -> String {
//        let encoder = JSONEncoder()
//        let credentialData = try! encoder.encode(self)
//        return String(data: credentialData, encoding: .utf8)!
//    }
//    static func decode(_ credentialString: String) -> CredentialsModel {
//        let decoder = JSONDecoder()
//        let jsonData = credentialString.data(using: .utf8)
//        return try! decoder.decode((Credentials.self), from: jsonData!)
//    }
}
