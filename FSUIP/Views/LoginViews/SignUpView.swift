//
//  SignUpView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @ObservedObject  var model: CredentialsModel
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
                
                TextFieldForLoginScreen(textValue: $model.email_SignUp, placeholder: "Email", icon: "at", onEditingChanged: { flag in withAnimation {
                        self.formOffset = flag ? 0 : 0}})
                
                TextFieldForLoginScreen(textValue: $model.password_SignUp, placeholder: "Придумайте пароль", icon: "lock", isSecure: true, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? 0 : 0}})
                
                TextFieldForLoginScreen(textValue: $model.reEnterPassword, placeholder: "Повторите свой пароль", icon: "lock.rotation", isSecure: true, onEditingChanged: { flag in withAnimation {
                    self.formOffset = flag ? -200 : 0}})
                
                ButtonForLoginScreens(text: "Зарегистрироваться") {
                    model.singUp()
                }
            }
            
            Button(action: {
                self.presentSignupSheet.toggle()
            }) {
                Text("Вернуться к экрану входа.").accentColor(Color.blue)
            }
            
            
        }
        .onTapGesture { UIApplication.shared.endEditing() }
        .padding()
        .offset(y: self.formOffset)
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Внимание"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                if model.alertMsg == "На ваш email выслано письмо. Подтвердите регистрацию." {
                    
                    self.presentSignupSheet = false
                    model.email_SignUp = ""
                    model.password_SignUp = ""
                    model.reEnterPassword = ""
                }
            }))
        })
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView(presentSignupSheet: .constant(false))
//    }
//}
