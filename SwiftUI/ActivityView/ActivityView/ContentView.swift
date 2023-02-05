//
//  ContentView.swift
//  ActivityView
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isSharePresented = false
    let customActivity = ActivityViewCustom(title: "Telegram", imageName: "telegram") {
        print("do something")
    }
    var body: some View {
        Button("Share") {
            self.isSharePresented = true
        }.sheet(isPresented: $isSharePresented) {
            ActivityView(activityItems: ["message test"], applicationsActivitys: [self.customActivity])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
