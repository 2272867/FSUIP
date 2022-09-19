//
//  CategotyModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 29.08.22.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable {
    let id = UUID()
    let title: String
    let image: Image
    let presentPage: Any
    
}
