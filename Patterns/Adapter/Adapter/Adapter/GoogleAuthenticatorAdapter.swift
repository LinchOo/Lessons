//
//  GoogleAuthenticatorAdapter.swift
//  Adapter
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation
class GoogleAuthenticatorAdapter: AuthentificationServise {
    var authentificator = GoogleAuthenticator()
    
    func login(email: String,
               password: String,
               success: @escaping (User, Token) -> Void,
               failure: @escaping (Error?) -> Void) {
        authentificator.login(email: email, password: password) { currentUser, error in
            guard let currentUser = currentUser else {
                failure(error)
                return
            }
            let user = User(email: currentUser.email, password: currentUser.password)
            let token = Token(value: currentUser.token)
            success(user, token)
        }
    }
}
