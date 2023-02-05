//
//  ViewController.swift
//  Adapter
//
//  Created by Олег Коваленко on 19.01.2023.
//

import UIKit

class ViewController: UIViewController {
    var authService: AuthentificationServise = GoogleAuthenticatorAdapter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createUser(email: "Kova@gmail.com", password: "SDdw2da244")
        
    }
    func createUser(email: String, password: String) {
        authService.login(email: email, password: password) { (user, token) in
            print("Auth succeeded: \(user.email), \(token.value)")
        } failure: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }


}

