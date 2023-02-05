//
//  ContentView.swift
//  CustomSheet+Action+Bottom+GestureState
//
//  Created by Олег Коваленко on 03.02.2023.
//

import SwiftUI

struct ContentView<Content: View>: View {
    let content: () -> Content
    
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    @State var maxHeight2 = UIScreen.main.bounds.height - 100
    @State var isOpen = false
    
    var dragGesure: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded{ value in
                // Maximum Height for sheet
                let maxHeight = UIScreen.main.bounds.height - 100
                withAnimation {
                    
                    // Cheker Open / Clouse
                    if isOpen == false {
                        if -currentMenuOffsetY > 50 {
                            currentMenuOffsetY = -maxHeight
                        } else {
                            currentMenuOffsetY = 0
                        }
                        isOpen.toggle()
                    } else {
                        if -currentMenuOffsetY < maxHeight - 50 {
                            currentMenuOffsetY = 0
                        } else {
                            currentMenuOffsetY = -maxHeight
                        }
                        isOpen.toggle()
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    func onChangeMenuOffset() {
        // Async function updater offset //
        DispatchQueue.main.async {
            self.currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
    }
    
    var body: some View {
        ZStack {
            Color("background")
            content()
                .frame(height: UIScreen.main.bounds.height + 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("alert")))
                .ignoresSafeArea(.all,edges: .bottom)
                .offset(y: UIScreen.main.bounds.height) // stratup offset for sheet
                .offset(y: currentMenuOffsetY) // cheker
                .gesture(dragGesure) // gesture cheker
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView{
            VStack{
                Capsule()
                    .fill(.white)
                    .frame(width: 80, height: 3)
                    .padding(.top)
                ForEach(0..<4) { _ in
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
