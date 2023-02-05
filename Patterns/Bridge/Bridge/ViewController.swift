//
//  ViewController.swift
//  Bridge
//
//  Created by Олег Коваленко on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var dayPicker: DayPickerView!
    
    
    //MARK: Variables
    var days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
    
    //MARK: Load
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dayPicker.dataSource = self
        
        
    }
    //MARK: Func
    
    
}
//MARK: Extension
extension ViewController: DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        return days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return days[indexPath.row]
    }
    
    
}
