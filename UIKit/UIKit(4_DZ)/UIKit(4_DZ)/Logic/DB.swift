//
//  Registration.swift
//  UIKit(4_DZ)
//
//  Created by Олег Коваленко on 28.12.2022.
//

import UIKit

class DB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func dbReguest(em: String, pass: String) -> Bool {
        let DB = ["1faramir1@gmail.com":"2432","fanatoleg@ukr.net":"2432","1":"1"]
        for el_mail in DB.keys {
            if el_mail == em && DB[el_mail] == pass {
                return true
            }
        }
    return false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
