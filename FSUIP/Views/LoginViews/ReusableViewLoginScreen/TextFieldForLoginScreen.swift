//
//  TextFieldForLoginScreen.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct TextFieldForLoginScreen: View {
    @Binding var textValue: String
    
    var placeholder: String
    var icon: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var onEditingChanged: ((Bool) -> ()) = {_ in}
    
    var body: some View {
        HStack {
            if isSecure{
                SecureField(placeholder, text: $textValue, onCommit: {
                    self.onEditingChanged(false)
                })
                .padding()
            } else {
                TextField(placeholder, text: $textValue, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                })
                .padding()
                .keyboardType(keyboardType)
            }
            
            Image(systemName: icon)
                .imageScale(.large)
                .padding()
                .foregroundColor(.purple.opacity(0.7))
        }
        .textInputAutocapitalization(_: .never)
        .background(Color.gray.opacity(0.2))
        .clipShape(Capsule())
        
    }
}

//struct LoginScreenTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldForLoginScreen(textValue: $textValue, placeholder: "123", icon: "")
//    }
//}
