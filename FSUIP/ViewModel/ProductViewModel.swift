//
//  ProductViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 18.09.22.
//

import SwiftUI
import Combine
import FirebaseFirestore
 
class ProductViewModel: ObservableObject {
    
  @Published var product: ProductModel
  @Published var modified = false
    
  private var cancellables = Set<AnyCancellable>()
    
    init(product: ProductModel = ProductModel(title: " ", description: " ", image: " ", price: 0, productBrand: " ", category: " ", productWeight: 0)) {
    self.product = product
      
    self.$product
      .dropFirst()
      .sink { [weak self] product in
        self?.modified = true
      }
      .store(in: &self.cancellables)
  }
}
