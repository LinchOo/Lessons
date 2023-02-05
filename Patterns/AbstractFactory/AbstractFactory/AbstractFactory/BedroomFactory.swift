//
//  BedroomFactory.swift
//  AbstractFactory
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

class BedroomFactory : AbstractFactory {
    func createChair() -> Chair {
        return BedroomChair() as Chair
    }
    
    func createSofa() -> Sofa {
        return BedroomSofa() as Sofa
    }
    
    func createTable() -> Table {
        return BedroomTable() as Table
    }
}
