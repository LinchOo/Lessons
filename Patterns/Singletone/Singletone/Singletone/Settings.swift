//
//  Settings.swift
//  Singletone
//
//  Created by Олег Коваленко on 15.01.2023.
//

import UIKit

class Settings {
    static let shared = Settings()
    
    var colorStyle = UIColor.white
    var volumeLevel: Float = 1.0
    private init() {}
    
}
