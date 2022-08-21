//
//  SignUpView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    
    @State private var formOffset: CGFloat = 0
    
    @Binding var presentSignupSheet: Bool
    
    var body: some View {
        
        VStack(spacing: 40.0) {
            Image("petShopLogo")
                .resizable()
                .frame(width: 201, height: 113)
            
            Text("Регистрация:")
                .font(.system(size: 16))
            
            VStack(spacing: 10.0) {
                TextFieldForLoginScreen(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"), onEditingChanged: { flag in withAnimation {
                        self.formOffset = flag ? 0 : 0
                    }
                })
                
                TextFieldForLoginScreen(value: self.$password, placeholder: "Придумайте пароль", icon: Image(systemName: "lock"), isSecure: true, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? 0 : 0
                    }
                })
                
                TextFieldForLoginScreen(value: self.$confirmedPassword, placeholder: "Повторите свой пароль", icon: Image(systemName: "lock.rotation"), isSecure: true, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? -200 : 0
                    }
                })
                
                ButtonForLoginScreens(text: "Зарегистрироваться") {
                    
                }
            }
            
            Button(action: {
                self.presentSignupSheet.toggle()
            }) {
                Text("Уже есть аккаунт?").accentColor(Color.blue)
            }
            
            
        }
        .onTapGesture { UIApplication.shared.endEditing() }
        .padding()
        .offset(y: self.formOffset)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(presentSignupSheet: .constant(false))
    }
}
