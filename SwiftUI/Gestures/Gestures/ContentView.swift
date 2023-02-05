//
//  ContentView.swift
//  Gestures
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI


//--------////--------////--------////--------//
//MARK: Tap Gesture
//--------////--------////--------////--------//
struct TapView: View {
    @State var tapped = false
    var tap: some Gesture{
        TapGesture(count: 1)
            .onEnded{ _ in
                self.tapped.toggle()
            }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .green : .blue)
                .frame(width: 100,height: 100)
            Text("Tap")
        }
        .gesture(tap)
    }
}

//--------////--------////--------////--------//
//MARK: LongTap Gesture
//--------////--------////--------////--------//
struct LongTapView: View {
    @State var tapped = false
    var longTap: some Gesture{
        LongPressGesture(minimumDuration: 1)
            .onEnded{ _ in
                withAnimation {
                    self.tapped.toggle()
                }
            }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .green : .blue)
                .frame(width: 100,height: 100)
            Text("LongTapView")
        }
        .gesture(longTap)
    }
}
//--------////--------////--------////--------//
//MARK: Drag Gesture
//--------////--------////--------////--------//
struct DragView: View {
    @State var isDragging = false
    @State var currentOffSetX: CGFloat = 0
    @State var currentOffSetY: CGFloat = 0
    var drag: some Gesture{
        DragGesture()
            .onChanged{ value in
                withAnimation {
                    currentOffSetX = value.translation.width
                    currentOffSetY = value.translation.height
                    self.isDragging.toggle()
                }
            }
            .onEnded { _ in
                withAnimation {
                    self.isDragging.toggle()
                    currentOffSetX = 0
                    currentOffSetY = 0
                }
            }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isDragging ? .green : .blue)
                .frame(width: 100,height: 100)
            Text("DragView")
        }
        .offset(x: currentOffSetX, y: currentOffSetY)
        .gesture(drag)
    }
}

//--------////--------////--------////--------//
//MARK: Magnification Gesture
//--------////--------////--------////--------//
struct MagnificationView: View {
    @State var scale: CGFloat = 1
    
    var magnification: some Gesture{
        MagnificationGesture()
            .onChanged{ value in
                scale = value
            }
            .onEnded{ _ in
                scale = 1
            }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .frame(width: 100,height: 100)
            Text("MagnificationView")
        }
        .scaleEffect(scale)
        .gesture(magnification)
    }
}
//--------////--------////--------////--------//
//MARK: Rotation Gesture
//--------////--------////--------////--------//
struct RotationView: View {
    @State var angle = Angle(degrees: 0.0)
    
    var rotation: some Gesture{
        RotationGesture()
            .onChanged{ angle in
                self.angle = angle
            }
            .onEnded{ _ in
                withAnimation {
                    self.angle = Angle(degrees: 0.0)
                }
            }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .frame(width: 100,height: 100)
            Text("RotationView")
        }
        .rotationEffect(angle)
        .gesture(rotation)
    }
}
//--------////--------////--------////--------//
//MARK: Sequenced Gestures
//--------////--------////--------////--------//
struct SequencedView: View {
    @State var tapped = false
    @State var isDragging = false
    @State var currentOffSetX: CGFloat = 0
    @State var currentOffSetY: CGFloat = 0
    
    var longTap: some Gesture{
        LongPressGesture(minimumDuration: 1)
            .onEnded{ _ in
                withAnimation {
                    self.tapped.toggle()
                }
            }
    }
    
    var drag: some Gesture{
        DragGesture()
            .onChanged{ value in
                withAnimation {
                    currentOffSetX = value.translation.width
                    currentOffSetY = value.translation.height
                    self.isDragging.toggle()
                }
            }
            .onEnded { _ in
                withAnimation {
                    self.isDragging.toggle()
                    currentOffSetX = 0
                    currentOffSetY = 0
                    self.tapped.toggle()
                }
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .green : .blue)
                .frame(width: 100,height: 100)
            Text("SequencedView")
        }
        .offset(x: currentOffSetX, y: currentOffSetY)
        .gesture(longTap.sequenced(before: drag))
        
    }
}
//--------////--------////--------////--------//





struct ContentView: View{
    var body: some View {
        //TapView()
        //LongTapView()
        //DragView()
        //MagnificationView()
        SequencedView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
