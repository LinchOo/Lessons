//
//  Exercise.swift
//  FactoryMethod
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

protocol Exercise {
    var name: String{get}
    var type: String{get}
    
    func start()
    func stop()
}
