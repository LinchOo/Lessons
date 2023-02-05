//
//  ContentView.swift
//  ScrollView
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack{
            headerView
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(1..<3, id: \.self) { _ in
                                cardView
                            }
                        }
                    }
                    ForEach(1..<10, id: \.self) { _ in
                        paymentView
                    }
                    Spacer()
                        .frame(height: 150)
                }
            }
            .background(.white)
            .cornerRadius(20)
            .offset(y: 20)
        }
        .background(
            Color.black
                .ignoresSafeArea(.all, edges: .all)
        )
    }
    var headerView: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("My Cards")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "bell.adn.waveform.fill")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 20, height: 20, alignment: .topTrailing)
        }
    }
    var paymentView: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Visa")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.trailing,5)
            VStack(alignment: .leading) {
                Text("Apple")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("30.02.2023")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.light)
            }
            Spacer()
            Text("+33400$")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .padding(.horizontal)
    }
    var cardView: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(colors: [.black.opacity(0.9),.blue], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: UIScreen.main.bounds.width - 30, height: 180)
            cardItemView
        }
        .padding()
    }
    var cardItemView: some View {
        VStack(alignment: .leading) {
            Text("Universal Bank")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
            HStack {
                ForEach(1...4, id: \.self) { _ in
                    Circle()
                        .fill(.white)
                        .frame(width: 3, height: 3, alignment: .bottom)
                }
                Text("1170")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Text("Visa")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(height: 110, alignment: .bottom)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
