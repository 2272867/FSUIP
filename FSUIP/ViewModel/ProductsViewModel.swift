//
//  ProductsViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 18.09.22.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseCore

final class ProductsViewModel: ObservableObject {
    @Published var products = [ProductModel]()
    
    
    
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit {
        unsubscribe()
    }
    
    func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func subscribe() {
        if listenerRegistration == nil {
            listenerRegistration = db.collection("products").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("no documents ")
                    return
                }
                
                self.products = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: ProductModel.self)
                    
                }
            }
        }
    }
    
    func removeProducts(atOffsets indexSet: IndexSet) {
        let products = indexSet.lazy.map { self.products[$0] }
        products.forEach { product in
            if let documentId = product.id {
                db.collection("products").document(documentId).delete { error in
                    if let error = error {
                        print("Unable to remove document: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
