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
    
    
    //            if isShowingProductDetails {
    //                FullDetailsProductViewModel(isShowingProductDetails: $isShowingProductDetails)
    //
    //            }
    //
    //                            Picker(
    //                                selection: $selectedCategory,
    //                                label: Text("Picker"),
    //                                content: {
    //                                    ForEach(filterCategories.indices) { index in
    //                                        Text(filterCategories[index])
    //                                            .tag(filterCategories[index])
    //                                    }
    //                                }).pickerStyle(SegmentedPickerStyle())
    
    
    
    //    @State var selectedCategory: String = "Собаки"
    
    //    init() {
    //        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.purple.withAlphaComponent(0.5)
    //
    //        let attributes: [NSAttributedString.Key:Any] = [
    //            .foregroundColor : UIColor.white
    //        ]
    //        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    //    }
}
