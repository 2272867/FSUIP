//
//  TextFieldForLoginScreen.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct TextFieldForLoginScreenViewModel: View {
    @Binding var textValue: String
    @State private var isShowingHidenText: Bool = true
    
    var placeholder: String
    var icon: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var onEditingChanged: ((Bool) -> ()) = {_ in}
    
    var body: some View {
        HStack {
            if isSecure {
                ZStack {
                    Group {
                        if isShowingHidenText {
                            SecureField(placeholder, text: $textValue, onCommit: {
                                self.onEditingChanged(false)
                            })
                            .padding()
                        } else {
                            TextField(placeholder, text: $textValue, onCommit: {
                                self.onEditingChanged(false)
                            })
                            .padding()
                        }
                    }
                }
                
            } else {
                TextField(placeholder, text: $textValue, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                })
                .padding()
                .keyboardType(keyboardType)
            }
            if isSecure {
                Button(action: {
                    isShowingHidenText.toggle()
                }, label: {
                    if isShowingHidenText {
                        Image(systemName: icon)
                            .imageScale(.large)
                            .frame(width: 22, height: 22)
                            .padding()
                            .foregroundColor(.purple.opacity(0.7))
                        
                    } else {
                        Image(systemName: icon + ".slash")
                            .imageScale(.large)
                            .frame(width: 22, height: 22)
                            .padding()
                            .foregroundColor(.purple.opacity(0.7))
                    }
                })
            } else {
                Image(systemName: icon)
                    .imageScale(.large)
                    .frame(width: 22, height: 22)
                    .padding()
                    .foregroundColor(.purple.opacity(0.7))
            }
        }
        .textInputAutocapitalization(_: .never)
        .background(Color.gray.opacity(0.2))
        .clipShape(Capsule())
        
    }
}
