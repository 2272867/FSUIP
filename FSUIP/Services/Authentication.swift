//
//  Authentication.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
