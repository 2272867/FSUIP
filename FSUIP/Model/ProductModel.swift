//
//  ProductModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 29.08.22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct ProductModel: Identifiable, Codable {
    
    @DocumentID var id: String?
    var title: String
    var description: String
    var image: String
    var price: Int
    var productBrand: String
    var category: String
    var productWeight: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case price
        case productBrand
        case category
        case productWeight
    }
}

struct Order: Identifiable, Codable {
  @DocumentID var id: String?
  var username: String
  var title: String
  var price: Int
  var image: String
}
