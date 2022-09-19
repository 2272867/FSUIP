//
//  ReversImageColorForDarkTheme.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 5.09.22.
//

import SwiftUI


struct DetectThemeChange: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        
        if(colorScheme == .dark){
            content.colorInvert()
        }else{
            content
        }
    }
}

extension View {
    func invertOnDarkTheme() -> some View {
        modifier(DetectThemeChange())
    }
}
