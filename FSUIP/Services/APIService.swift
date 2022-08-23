//
//  APIService.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import Foundation

class APIService {
    static let shared = APIService()
    enum APIError: Error {
        case error
    }
    
    func login(credentials: Credentials, complition : @escaping (Result<Bool, APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                complition(.success(true))
            } else {
                complition(.failure(APIError.error))
            }
        }
    }
}
