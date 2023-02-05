//
//  ContentView.swift
//  Picker
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var timeSectionSelected = 0
    @State var daySectionSelected = 0
    @State var airMode = false
    
    var timeSpentArrey = ["5 min","10 min","15 min","20 min","25 min","30 min"]
    var dayArrey = ["Monday","Thuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $timeSectionSelected, label: Text("Time spent")) {
                    ForEach(0..<timeSpentArrey.count){
                        Text(self.timeSpentArrey[$0])
                    }
                }
                Toggle(isOn: $airMode) {
                    Text("AirMode").foregroundColor(airMode ? Color.gray : Color.orange)
                }
                Picker(selection: $daySectionSelected,label: Text("Current Day")) {
                    ForEach(0..<dayArrey.count){
                        Text(self.dayArrey[$0])
                    }
                }
                Picker(selection: $daySectionSelected,label: Text("Current Day")) {
                    ForEach(0..<100){
                        Text("item = \($0)")
                    }
                }
            }.navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
