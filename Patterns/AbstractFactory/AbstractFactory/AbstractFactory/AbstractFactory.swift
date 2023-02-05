//
//  AbstractFactory.swift
//  AbstractFactory
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

protocol AbstractFactory {
    func createChair() -> Chair
    func createSofa() -> Sofa
    func createTable() -> Table
}
