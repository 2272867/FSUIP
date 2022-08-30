//
//  ProductModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 29.08.22.
//

import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore

struct ProductModel: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String
    let description: String
    let imageName: String?
    let price: Double
    let discont: Int
    let productBrand: String
    let category: String
    let productWeight: Double
}
