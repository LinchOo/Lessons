//
//  ViewController.swift
//  Decorator
//
//  Created by Олег Коваленко on 19.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Label
    @IBOutlet weak var costLabel: UILabel! {
        didSet{
            costLabel.text = String(bmw.getPrice()) + "$"
        }
    }
    @IBOutlet weak var equipmentLabel: UILabel!
    
    
    //MARK: Variables
    
    var bmw: AutoProtocol = BMWx6()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Action
    @IBAction func equipmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            bmw = BMWx6()
            costLabel.text = String(bmw.getPrice()) + "$"
            equipmentLabel.text = bmw.getEquipment()
        case 1:
            bmw = BMWx6()
            bmw = Business(decorator: bmw)
            costLabel.text = String(bmw.getPrice()) + "$"
            equipmentLabel.text = bmw.getEquipment()
        case 2:
            bmw = BMWx6()
            bmw = Premium(decorator: bmw)
            costLabel.text = String(bmw.getPrice()) + "$"
            equipmentLabel.text = bmw.getEquipment()
        default:
            break
        }
    }
    
}

