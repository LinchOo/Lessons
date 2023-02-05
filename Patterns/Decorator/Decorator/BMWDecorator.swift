//
//  BMWDecorator.swift
//  Decorator
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation

class BMWDecorator: AutoProtocol {
    private let decoratorType: AutoProtocol
    required init(decorator: AutoProtocol){
        self.decoratorType = decorator
    }
    func getEquipment() -> String {
        return decoratorType.getEquipment()
    }
    
    func getPrice() -> Double {
        return decoratorType.getPrice()
    }
    
    
}
