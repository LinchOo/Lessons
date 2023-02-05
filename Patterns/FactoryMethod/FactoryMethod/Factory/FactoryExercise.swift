//
//  FactoryExercise.swift
//  FactoryMethod
//
//  Created by Олег Коваленко on 15.01.2023.
//

import Foundation

enum Exercises {
    case Jumping, Squarts, SwingPress
}
class FactoryExercises {
    static let defaultFactory = FactoryExercises()
    func createExercise(name: Exercises) -> Exercise {
        switch name {
        case .Jumping: return Jumping()
        case .Squarts: return Squarts()
        case .SwingPress: return SwingPress()
        }
    }
}
