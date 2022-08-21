//
//  LoginView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @ObservedObject var model : CredentialsModel
    
    @State private var formOffset: CGFloat = 0
    @State private var presentSignupSheet = false
    @State private var presentPasswordRecoverySheet = false
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 40.0) {
                
                Image("petShopLogo")
                    .resizable()
                    .frame(width: 201, height: 113)
                
                Text("Войдите в свой аккаунт:")
                    .font(.system(size: 16))
                
                VStack(spacing: 10.0) {
                    TextFieldForLoginScreen(textValue: $model.email, placeholder: "Email", icon: "at", keyboardType: .emailAddress, onEditingChanged: { flag in withAnimation { self.formOffset = flag ? 0 : 0 }
                    })
                    
                    
                    TextFieldForLoginScreen(textValue: $model.password, placeholder: "Пароль", icon: "lock", isSecure: true, onEditingChanged: { flag in withAnimation {
                        self.formOffset = flag ? -200 : 0
                        }
                    })
                    
                    ButtonForLoginScreens(text: "Войти", action: {
                        model.login()

                    })
                }
                                
                Button(action: {
                    self.presentSignupSheet.toggle()
                }) {
                    Text("Всё ещё нет акаунта? Присоеденитесь.")
                        .font(.system(size: 16))
                        .accentColor(Color.purple.opacity(0.8))
                }.sheet(isPresented: self.$presentSignupSheet) {
                    SignUpView(model: model, presentSignupSheet: self.$presentSignupSheet)
                }
                
                Button(action: {
                    self.presentPasswordRecoverySheet.toggle()
                }) {
                    Text("Забыли свой пароль?")
                        .font(.system(size: 16))
                        .accentColor(Color.blue)
                }
                .sheet(isPresented: self.$presentPasswordRecoverySheet) {
                    ForgotPasswordView(model: model, presentPasswordRecoverySheet: self.$presentPasswordRecoverySheet)
                }
            }
            .alert(isPresented: $model.alert, content: {
                Alert(title: Text("Внимание"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK")))
            })

            .onTapGesture { UIApplication.shared.endEditing() }
            .padding()
            .offset(y: self.formOffset)
            
            if model.isLoading {
                
                LoadingView()
            }
            
        }
        
        
    }
}

struct LoadingView: View {
    @State var animation = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.purple.opacity(0.8), lineWidth: 8)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
        }
        .background(.clear)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1)) {
                animation.toggle()
            }
        })
    }
}
