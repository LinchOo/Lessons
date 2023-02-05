//
//  ContentView.swift
//  SimpleTransitions
//
//  Created by Олег Коваленко on 26.01.2023.
//

import SwiftUI


extension AnyTransition {
    static var zoomAsymInOut: AnyTransition {
        .asymmetric(insertion: .scale(scale: 0.1, anchor: .center).combined(with: .offset(x: 120)),removal: .scale(scale: 0.2).combined(with: .opacity).combined(with: .offset(x: -120)))
    }
    
}

struct ContentView: View {
    @State var isAlertShown = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("background")
            HStack {
                Text("Transitions")
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
                questuinMarkView
            }
            .blur(radius: isAlertShown ? 8 : 0)
            .padding()
            if isAlertShown {
                alertView
                    .transition(.zoomAsymInOut)
                    .zIndex(1)
            }
        }
    }
    var questuinMarkView: some View {
        Button {
            withAnimation {
                isAlertShown.toggle()
            }
            
        } label: {
                Image(systemName: "questionmark")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundColor(Color(.black))
            }
        }
    var alertView: some View {
        VStack(spacing: 20) {
            Text("Copy redy")
                .foregroundColor(.white)
            Image(systemName: "questionmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            Button("Cancel") {
                withAnimation {
                    isAlertShown.toggle()
                }
            }
            .foregroundColor(Color(.gray))
        }
        .frame(width: 250, height: 150)
        .padding(35)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.black).opacity(0.6)))
        .padding(.top, 100)
        .shadow(radius: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
