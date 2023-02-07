//
//  FoodView.swift
//  MatchedGeometryEffect
//
//  Created by Олег Коваленко on 07.02.2023.
//

import SwiftUI

struct FoodView: View {
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("background"))
                .frame(width: 200, height: 300)
                .overlay {
                    Text("Dolma 200gr")
                        .bold()
                        .foregroundColor(.orange)
                }
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.6))
                        .frame(width: 200, height: 200)
                }
                .overlay {
                    Image("dolma")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .offset(x: -70, y: -120)
                }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
