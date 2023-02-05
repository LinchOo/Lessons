//
//  ViewController.swift
//  Swith(code)
//
//  Created by Олег Коваленко on 28.12.2022.
//

import UIKit

class ViewController: UIViewController {

    let mySwitch = UISwitch()
    let myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myButton.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.myButton.backgroundColor = UIColor.orange
        self.myButton.setTitle("OK", for: .normal)
        self.myButton.setTitle("Pressed", for: .highlighted)
        self.myButton.isUserInteractionEnabled = false
        
        self.view.addSubview(self.myButton)
        
        self.mySwitch.frame = CGRect.zero
        self.mySwitch.center = self.view.center
        
        self.view.addSubview(self.mySwitch)
        
        self.mySwitch.tintColor = UIColor.green
        self.mySwitch.thumbTintColor = UIColor.red
        self.mySwitch.onTintColor = UIColor.blue
        
        self.mySwitch.addTarget(self, action: #selector(switchChange(target:)), for: .valueChanged)
    }
    @objc func switchChange(target: UISwitch) {
        if target.isOn {
            self.myButton.isUserInteractionEnabled = true
        } else {
            self.myButton.isUserInteractionEnabled = false
        }
    }
}

