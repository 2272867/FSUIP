//
//  KeyCheinStorage.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 20.08.22.
//

import Foundation
import SwiftKeychainWrapper


enum KeyCheinStorage {
    static let key = "credentials"
    
//    static func getCredential() -> CredentialsModel? {
//        if let myCredentialsString = KeychainWrapper.standard.string(forKey: Self.key) {
//            return CredentialsModel.decode(myCredentialsString)
//        } else {
//            return nil
//        }
//    }
//    
//    static func saveCredentials(_ credentials: CredentialsModel) -> Bool {
//        if KeychainWrapper.standard.set(credentials.encoded(), forKey: Self.key) {
//            return true
//        } else {
//            return false
//        }
//    }
}
