//
//  CustomSheet_Action_Bottom_GestureStateApp.swift
//  CustomSheet+Action+Bottom+GestureState
//
//  Created by Олег Коваленко on 03.02.2023.
//

import SwiftUI

@main
struct CustomSheet_Action_Bottom_GestureStateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView{
                VStack{
                    Capsule()
                        .fill(.white)
                        .frame(width: 80, height: 3)
                        .padding(.top)
                   
                    ForEach(0..<1) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("action"))
                            .frame(height: 100)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}
