//
//  Compose.swift
//  Compose
//
//  Created by Олег Коваленко on 20.01.2023.
//

import Foundation

protocol Compose {
    var name: String {get set}
    func showContent() -> Any
    func addComponent(c: Compose)
    func contentCount() -> Int
}

class File: Compose {
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name
    }
    
    func addComponent(c: Compose) {
        print("Create File")
    }
    
    func contentCount() -> Int {
        return 1
    }
}

class Folder: Compose {
    var name: String
    private var contentArray = [Compose]()
    
    init(name:String) {
        self.name = name
    }
    func showContent() -> Any {
        return contentArray
    }
    
    func addComponent(c: Compose) {
        return contentArray.append(c)
    }
    
    func contentCount() -> Int {
        return contentArray.count
    }
}
