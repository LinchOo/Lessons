//
//  ViewController.swift
//  AbstractFactory
//
//  Created by Олег Коваленко on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var chair: Chair?
    var sofa: Sofa?
    var table: Table?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chair = KitchenFactory().createChair()
        sofa = KitchenFactory().createSofa()
        table = KitchenFactory().createTable()
        chair?.material = "DASDASD"
        print(chair?.material)
        // Do any additional setup after loading the view.
    }


}

