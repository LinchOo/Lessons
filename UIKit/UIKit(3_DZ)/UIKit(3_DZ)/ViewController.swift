//  Created by Олег Коваленко on 26.12.2022.
import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var additionLabel: UILabel!
    
    //MARK: Start Func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        fullName()
    }
    
    //MARK: Actions
    @IBAction func AdditionButton(_ sender: Any) {
        addition()
    }
    
    //MARK: FUNCTIONS
    func fullName () {
        let alertController = UIAlertController(title: "Hi!", message: "Enter Full Name" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok!", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.fNameLabel.text! += (text?.text!)! + ("!")
            
        }
        alertController.addTextField{ (textField) in
            //textField.isSecureTextEntry = false
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func addition (){
        let alertController = UIAlertController(title: "additions!", message: "Enter two number to add them" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "lets add them!", style: .default) { (action) in
            
            let number1 = alertController.textFields?[0].text!
            let number2 = alertController.textFields?[1].text!
            let add = Int(number1 ?? "0")! + Int(number2 ?? "0")!
            let str = number1!+" + "+number2!+" = "+String(add)
            self.additionLabel.text = str
        }
        alertController.addTextField{ (textField) in }
        alertController.addTextField{ (textField) in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}
