//
//  ForgotPasswordView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var model: CredentialsModel
    @Binding var presentPasswordRecoverySheet: Bool
    
    var body: some View {
        
        VStack(spacing: 40) {
            Image("petShopLogo")
                .resizable()
                .frame(width: 201, height: 113)
            
            Text("Восстановление пароля:")
                .font(.system(size: 16))
            
            VStack(spacing: 10.0) {
                TextFieldForLoginScreenViewModel(textValue: $model.resetPassword, placeholder: "Email", icon: "at", keyboardType: .emailAddress)
                
                ButtonForLoginScreensViewModel(text: "Сбросить пароль") {
                    model.sendPasswordReset()
                }
            }
            
            Button(action: {
                self.presentPasswordRecoverySheet.toggle()
            }) {
                Text("Выйти на главный экран.")
                    .font(.system(size: 16))
                    .foregroundColor(Color.purple)
            }
        }
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Внимание"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                if model.alertMsg == "На ваш email выслано письмо для сброса пароля." {
                    
                    self.presentPasswordRecoverySheet = false
                    //                    model.resetPassword = ""
                }
            }))
        })
        .onTapGesture {
            UIApplication.shared.endEditing()
            
        }
        .padding()
    }
}

//struct ForgotPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgotPasswordView(presentPasswordRecoverySheet: .constant(false))
//    }
//}
