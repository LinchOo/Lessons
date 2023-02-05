//
//  Business.swift
//  Decorator
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation
class Business: BMWDecorator {
    required init(decorator: AutoProtocol) {
        super.init(decorator: decorator)
    }
    override func getEquipment() -> String {
        return "Bussines"
    }
    override func getPrice() -> Double {
        return super.getPrice() + 2500
    }
}

