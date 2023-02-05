//
//  ViewController.swift
//  FactoryMethod
//
//  Created by Олег Коваленко on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var exercisesArray = [Exercise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createExercise(exName: .Jumping)
        createExercise(exName: .Squarts)
        createExercise(exName: .SwingPress)
        runExercise()
        
        
        
    }
    func createExercise(exName: Exercises) {
        let newExercise = FactoryExercises.defaultFactory.createExercise(name: exName)
        exercisesArray.append(newExercise)
    }
    func runExercise() {
        for ex in exercisesArray{
            ex.start()
            //print("Start Exercises")
            ex.stop()
        }
    }


}

