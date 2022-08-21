//
//  SuperSecretExtantionToHideKeyboard.swift.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
