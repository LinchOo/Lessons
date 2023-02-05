//
//  ContentView.swift
//  SImpleAnimation
//
//  Created by Олег Коваленко on 26.01.2023.
//

import SwiftUI



//MARK: Simple Buttons Animation
//------------////------------////------------//
struct SimpleButtonAnimation: View {
    @State var isStated = false
    var body: some View {
        VStack {
            Spacer()
            VStack{
                ZStack{
                    Button {
                        // onPress
                    } label: {
                        Image(systemName: "bag.badge.plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                            .padding()
                            .clipShape(Circle())
                            .rotationEffect(Angle.degrees(isStated ? 0 : -90))
                    }
                    .background(Circle().fill(.orange).shadow(color: .black.opacity(0.5), radius: 8))
                    .offset(x: isStated ? 75 : 0, y: 0 )
                    .opacity(isStated ? 1 : 0)
                    Button{
                        // onPress
                    } label: {
                        Image(systemName: "calendar.badge.plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                            .padding()
                            .clipShape(Circle())
                            .rotationEffect(Angle.degrees(isStated ? 0 : -90))
                    }
                    .background(Circle().fill(.orange).shadow(color: .black.opacity(0.5), radius: 8))
                    .offset(x: isStated ? -75 : 0, y: 0 )
                    .opacity(isStated ? 1 : 0)
                    
                    // Main Button
                    Button{
                        withAnimation(.spring()) {
                            isStated.toggle()
                        }
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                            .padding()
                            .clipShape(Circle())
                            .rotationEffect(Angle.degrees(isStated ? 0 : -90))
                    }
                    .background(Circle().fill(.orange).shadow(color: .black.opacity(0.5), radius: 8))
                }
            }
        }
    }
}

//MARK: Circle Loading Animation
//------------////------------////------------//
struct CircleLoading: View {
    @State var isStated = false
    @State var circleProgress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90))
                .padding(40)
            Spacer()
            Button {
                withAnimation(.spring(response: 1, dampingFraction: 0.9, blendDuration: 0.55)) {
                    isStated.toggle()
                    circleProgress = isStated ? 1.0 : 0.0
                }
            }label: {
                Text("Start")
            }
            .padding(.bottom)
        }
    }
}


//MARK: Simple Animation Effects
//------------////------------////------------//
struct SimpleAnimationEffects: View {
    @State var isStated = false
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 100,height: 100)
                //.offset(x:0, y: isStated ? 300 : 0)
                //.position(isStated ? CGPoint(x: 150, y: 300) : CGPoint(x: 150, y: 50) )
                //.opacity(isStated? 0 : 1)
                //.rotationEffect(Angle.degrees(isStated? 180 : 0))
                .scaleEffect(isStated ? 0.5 : 1.0, anchor: .topTrailing)
            Spacer()
            Button{
                withAnimation(.easeIn) {
                    isStated.toggle()
                }
            } label: {
                Text("Start")
            }
            .padding(.bottom)
        }
    }
}
struct ContentView: View {
    var body: some View {
        //SimpleAnimationEffects()
        //CircleLoading()
        SimpleButtonAnimation()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
