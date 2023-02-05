//
//  ViewController.swift
//  Momento
//
//  Created by Олег Коваленко on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBoard: DrawView!
    
    var carrierState: CarrierState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBoard.lineColor = UIColor.black
        
        let lines = LinesManager.shared
        carrierState = CarrierState(linesManager: lines)
        
    }

    @IBAction func saveButton(_ sender: Any) {
        carrierState.saveLine()
    }
    
    @IBAction func loadButton(_ sender: Any) {
        carrierState.loadLine()
        carrierState.linesManager.printLines(in: viewBoard)
    }
    @IBAction func redSetButton(_ sender: Any) {
        viewBoard.lineColor = .red
    }
    @IBAction func greenSetButton(_ sender: Any) {
        viewBoard.lineColor = .green
    }
    @IBAction func blueSetButton(_ sender: Any) {
        viewBoard.lineColor = .blue
    }
}

