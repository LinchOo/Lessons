//
//  ViewController.swift
//  Builder(YARCH)
//
//  Created by Олег Коваленко on 19.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonStart(_ sender: Any) {
        let controller = CatalogBuilder().setTitle("Catalog").build()
        self.present(controller, animated: true, completion: nil)
    }
}

