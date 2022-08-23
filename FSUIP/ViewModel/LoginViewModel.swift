//
//  LoginViewModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 14.08.22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showTabBarView = false
    
    var loginDisable: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showTabBarView = true
        APIService.shared.login(credentials: credentials) { [unowned self](result:Result<Bool, APIService.APIError>) in
            showTabBarView = false
            switch result {
            case .success:
                completion(true)
            case .failure:
                credentials = Credentials()
                completion(false)
            }
        }
    }
    
    
}
