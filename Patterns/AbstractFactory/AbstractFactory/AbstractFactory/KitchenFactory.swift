//
//  KitchenFactory.swift
//  AbstractFactory
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

class KitchenFactory : AbstractFactory {
    func createChair() -> Chair {
        return KitchenChair() as Chair
    }
    
    func createSofa() -> Sofa {
        return KitchenSofa() as Sofa
    }
    
    func createTable() -> Table {
        return KitchenTable() as Table
    }
}
