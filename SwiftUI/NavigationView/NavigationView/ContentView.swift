//
//  ContentView.swift
//  NavigationView
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userBuy = UserBuy()
    @State var selector: String?
    
    let coffe = "coffe"
    let tea = "tea"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You choise = \(userBuy.caps) caps")
                Text("What you wish?")
                
                NavigationLink(destination: DetailView(text: coffe), tag: "Tag1", selection: $selector) {
                    EmptyView()
                }
                NavigationLink(destination: DetailView(text: tea), tag: "Tag2", selection: $selector) {
                    EmptyView()
                }
                Button("Go") {
                    DispatchQueue.main.async {
                        self.selector = "Tag1"
                    }
                    
                }
                .navigationBarTitle("Menu")
            }
        }
        .environmentObject(userBuy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
