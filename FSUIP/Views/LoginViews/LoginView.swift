//
//  LoginView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    @State private var formOffset: CGFloat = 0
    @State private var presentSignupSheet = false
    @State private var presentPasswordRecoverySheet = false
    
    var body: some View {
        VStack(spacing: 40.0) {
            
            Image("petShopLogo")
                .resizable()
                .frame(width: 201, height: 113)
            
            Text("Войдите в свой аккаунт:")
                .font(.system(size: 16))
            
            VStack(spacing: 10.0) {
                TextFieldForLoginScreen(value: $loginVM.credentials.email, placeholder: "Email", icon: Image(systemName: "at"), keyboardType: .emailAddress, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? 0 : 0
                    }
                })
                
                
                TextFieldForLoginScreen(value: $loginVM.credentials.password, placeholder: "Пароль", icon: Image(systemName: "lock"), isSecure: true, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? -200 : 0
                    }
                })
                
                ButtonForLoginScreens(text: "Войти", action: {
                    loginVM.login { success in
                        authentication.updateValidation(success: success)
                        
                    }
                })
            }
            .disabled(loginVM.showTabBarView)
            
            Button(action: {
                self.presentSignupSheet.toggle()
            }) {
                Text("Всё ещё нет акаунта? Присоеденитесь.")
                    .font(.system(size: 16))
                    .accentColor(Color.purple.opacity(0.8))
            }.sheet(isPresented: self.$presentSignupSheet) {
                SignUpView(presentSignupSheet: self.$presentSignupSheet)
            }
            
            Button(action: {
                self.presentPasswordRecoverySheet.toggle()
            }) {
                Text("Забыли свой пароль?")
                    .font(.system(size: 16))
                    .accentColor(Color.blue)
            }
            .sheet(isPresented: self.$presentPasswordRecoverySheet) {
                ForgotPasswordView(presentPasswordRecoverySheet: self.$presentPasswordRecoverySheet)
            }
        }
        .onTapGesture { UIApplication.shared.endEditing() }
        .padding()
        .offset(y: self.formOffset)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
