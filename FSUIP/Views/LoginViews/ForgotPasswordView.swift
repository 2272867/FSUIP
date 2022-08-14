//
//  ForgotPasswordView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @Binding var presentPasswordRecoverySheet: Bool
    
    var body: some View {
        
        VStack(spacing: 40) {
            Image("petShopLogo")
                .resizable()
                .frame(width: 201, height: 113)
            
            Text("Восстановление пароля:")
                .font(.system(size: 16))
            
            VStack(spacing: 10.0) {
                TextFieldForLoginScreen(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"), keyboardType: .emailAddress)
                
                ButtonForLoginScreens(text: "Сбросить пароль") {
                    
                }
            }
            
            Button(action: {
                self.presentPasswordRecoverySheet.toggle()
            }) {
                Text("Выйти")
                    .font(.system(size: 16))
                    .foregroundColor(Color.purple)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .padding()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(presentPasswordRecoverySheet: .constant(false))
    }
}
