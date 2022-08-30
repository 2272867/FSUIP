//
//  CredentialsModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import Foundation
import FirebaseAuth
import SwiftUI

protocol BaseCredentials {
    
    var email: String{ get }
    var password: String{ get }
    var email_SignUp: String{ get }
    var password_SignUp: String{ get set}
    var reEnterPassword: String{ get set }
    var resetPassword: String{ get set }
    
    func login()
    func singUp()
    func clearField()
    func logOut()
    func sendPasswordReset()
}

final class CredentialsModel: BaseCredentials, ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var resetPassword = ""
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    @AppStorage("login_Status") var status = false
    
    @Published var isLoading = false
    
    let user = Auth.auth().currentUser
    
    func login() {
       
        
        if email == "" || password == "" {
            self.alertMsg = "Заполните все поля!"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            withAnimation {
                self.isLoading.toggle()
            }

            if error != nil {
                self.alertMsg = error!.localizedDescription
                self.alert.toggle()
                return
            }
            withAnimation {
                self.status = true
            }
        }
        
        
        //тут есть вопросы по реализация, исправлять нужно
        if ((self.user?.isEmailVerified) != true) {
            
            self.alertMsg = "Пожалуйста, подтвердите email"
            self.alert.toggle()
            
            try! Auth.auth().signOut()
            
            return
        }
        
       
        
    }
    
    func singUp() {
        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == "" {
            self.alertMsg = "Заполните все поля!"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword {
            self.alertMsg = "Пароли не совпадают"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUp, password: password_SignUp) {
            (result, error) in
            
            withAnimation {
                self.isLoading.toggle()
            }
            
            if error != nil {
                self.alertMsg = error!.localizedDescription
                self.alert.toggle()
                return
            }
            
            result?.user.sendEmailVerification(completion: { (error) in
                if error != nil {
                    self.alertMsg = error!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.alertMsg = "На ваш email выслано письмо. Подтвердите регистрацию."
                self.alert.toggle()
            })
        }
    }
    
    func clearField() {
        
        email = ""
        password = ""
        email_SignUp = ""
        password_SignUp = ""
    }
    
    func logOut() {
        try! Auth.auth().signOut()
        
        withAnimation {
            self.status = false
        }
        
        clearField()

    }
    
    func sendPasswordReset() {
        
        Auth.auth().sendPasswordReset(withEmail: resetPassword) {_ in
            
            
            self.alertMsg = "На ваш email выслано письмо для сброса пароля."
            self.alert.toggle()
        }
    }
    
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
