//
//  Premium.swift
//  Decorator
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation
class Premium: BMWDecorator {
    required init(decorator: AutoProtocol) {
        super.init(decorator: decorator)
    }
    override func getEquipment() -> String {
        return "Premium"
    }
    override func getPrice() -> Double {
        return super.getPrice() + 5500
    }
}

