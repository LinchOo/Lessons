//
//  MenuView.swift
//  MatchedGeometryEffect
//
//  Created by Олег Коваленко on 07.02.2023.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var selectedFood: String
    @Binding var previouslyMenuSelected: String
    
    @Namespace private var menuSpace
    @Namespace private var menuSpace2
    
    private let menu = ["Drinks", "Food", "Bakary"]
    
    var body: some View {
        VStack(spacing: 150) {
            ForEach(menu, id:\.self){ item in
                ZStack(alignment: .bottom) {
                    if selectedFood == item {
                        menuItemView
                    }
                    
                    Text(item)
                        .foregroundColor(selectedFood == item ? .black : .black.opacity(0.6))
                        .frame(height: 70)
                        .scaleEffect(selectedFood == item ? 1.5 : 0.8)
                        .offset(y: -10)
                }
                .frame(width: 75)
                .onTapGesture {
                    previouslyMenuSelected = selectedFood
                    withAnimation(.spring()) {
                        selectedFood = item
                        //selectedFood = item
                        
                    }
                }
            }
            .rotationEffect(Angle(degrees: 270))
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("background"))
                .frame(width: 50, height: UIScreen.main.bounds.height + 100)
        )
        .offset(x: -10)
    }
        
    private var menuItemView: some View {
        VStack {
            Circle()
                .fill(Color("background"))
                .matchedGeometryEffect(id: "menuSpace2", in: menuSpace2)
                .frame(width: 80, height: 80)
                .offset(y: 10)
            Circle()
                .fill(.orange)
                .matchedGeometryEffect(id: "menuSpace1", in: menuSpace)
                .frame(width: 6, height: 6)
                .offset(y: -15)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedFood: .constant("Drinks"),previouslyMenuSelected: .constant("Drinks"))
    }
}
