//
//  ExtensionToSetItemColorsForBothColortheme.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 5.09.22.
//

import Foundation
import SwiftUI

extension Color {

    static var primaryColorDarkThemeWhitItem: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 255, green: 255, blue: 255, alpha: 1) : UIColor(red: 0, green: 0, blue: 0, alpha: 1) })
    }
    
    static var primaryColorDarkThemeDarkItem: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 0, green: 0, blue: 0, alpha: 1) : UIColor(red: 255, green: 255, blue: 255, alpha: 1) })
    }
    

}
