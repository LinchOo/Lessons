//
//  ViewController.swift
//  UIKit(4_DZ)
//
//  Created by Олег Коваленко on 28.12.2022.
//

import UIKit

class Main: UIViewController {

    // DB = [Emails:String, Passwords: String]
    
    
    //MARK: Outlets
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    let reg = DB()

    //MARK: Startap Func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //MARK: Actions
    @IBAction func LogInBt(_ sender: Any) {
        let em = EmailField.text ?? " "
        let pass = PasswordField.text ?? " "
        if (reg.dbReguest(em: em, pass: pass) == true) {
            let nextScreen = self.storyboard?.instantiateViewController(withIdentifier: "Registration")
            nextScreen?.modalPresentationStyle = .fullScreen
            self.show(nextScreen!, sender: nil)
        }else {
            let alertController = UIAlertController(title: "Warning!", message: "Wrong Email or Password" , preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok!", style: .default) { (action) in}
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}

