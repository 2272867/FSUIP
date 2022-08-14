//
//  ButtonForLoginScreens.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 13.08.22.
//

import SwiftUI

struct ButtonForLoginScreens: View {
    var text = "blow ur brain"
    var action: (()->()) = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                .frame(minWidth:0, maxWidth: .infinity)
                .padding(.vertical)
                .foregroundColor(.white)
                .background(Color.purple.opacity(0.8))
                .cornerRadius(30)
            }
        }
    }
}

struct LoginScreensButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForLoginScreens()
    }
}
