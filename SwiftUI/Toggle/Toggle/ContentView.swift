//
//  ContentView.swift
//  Toggle
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI


struct ContentView: View {
    @State var isOnToggle = false
    
    var body: some View {
        VStack {
            ZStack{
                HStack{
                    VStack{
                        Text("Buy")
                        Text("Sell")
                        Spacer().frame(height: 500)
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 10).fill(Color.yellow).offset(x: isOnToggle ? 100 : 0)
                Text("Some text").offset(x: isOnToggle ? 100 : 0)
            }
            Toggle(isOn: $isOnToggle) {
                Text("More")
            }.padding()
        }.animation(.spring(),value: 1)
        //.animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


