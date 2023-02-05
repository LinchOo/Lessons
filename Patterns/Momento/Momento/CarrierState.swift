//
//  CarrierState.swift
//  Momento
//
//  Created by Олег Коваленко on 21.01.2023.
//

import Foundation

class CarrierState {
    var state: StateLinesMomento?
    var linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    public func saveLine() {
        state = linesManager.save()
    }
    public func loadLine() {
        guard state != nil else {return}
        linesManager.load(state: state!)
    }
}
