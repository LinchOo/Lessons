//
//  LineModel.swift
//  Momento
//
//  Created by Олег Коваленко on 21.01.2023.
//

import UIKit

struct LineModel {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.start = start
        self.end = end
        self.color = color
    }
}
