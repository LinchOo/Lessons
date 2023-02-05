//
//  Chair.swift
//  AbstractFactory
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

protocol Chair {
    var name: String{get set}
    var model: String{get set}
    var material: String{get set}
    var price: String{get set}
}
