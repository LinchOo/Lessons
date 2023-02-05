//
//  ViewController.swift
//  Alert
//
//  Created by Олег Коваленко on 26.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiLebel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showButton(_ sender: Any) {
        self.hiLebel.text = "Hi,"
        self.alert(title: "Warrning", message: "Write password", style: .alert)
        
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message:  message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok!", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.hiLebel.text! += (text?.text!)! + ("!")
            
        }
        alertController.addTextField{ (textField) in
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
