//
//  ContentView.swift
//  MatchedGeometryEffect
//
//  Created by Олег Коваленко on 07.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var menuSelected = "Drinks"
    @State private var previouslyMenuSelected = ""
    
    
    var body: some View {
        HStack {
            MenuView(selectedFood: $menuSelected,previouslyMenuSelected: $previouslyMenuSelected)
            Spacer()
            switch menuSelected {
            case "Drinks":
                EmptyView()
            case "Food":
                EmptyView()
                    FoodView()
                        .transition(.asymmetric(insertion: .offset(y: -1000), removal: .offset(x: 1000)))
            case "Bakary":
                EmptyView()
            default:
                EmptyView()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
