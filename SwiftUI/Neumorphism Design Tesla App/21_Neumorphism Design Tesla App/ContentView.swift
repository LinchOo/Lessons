//
//  ContentView.swift
//  21_Neumorphism Design Tesla App
//
//  Created by Олег Коваленко on 04.02.2023.
//

import SwiftUI

struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Lightshadow"), radius: 5, x: -5, y: -5)
            .shadow(color: Color("Darkshadow"), radius: 5, x: 5, y: 5)
    }
}
struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Lightshadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("Darkshadow"), radius: 5, x: -5, y: -5)
    }
}
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color("Background")))
            .neumorphismUnSelectedStyle()
    }
}

extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
}



struct ContentView: View {
    
    @State var isCarOpen = false
    @State var tagSelected = -1
    @State var controllsArray = ["lock","airOff","charging","trunkClouse"]
    @Environment(\.colorScheme) var colorScheme
    
    
    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
    var headerView: some View {
        HStack {
            VStack(alignment: .center) {
                Text("Tesla Model X")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("226 km")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            //Spacer()
        }
        .padding(.all,25)
    }
    
    var carView: some View {
        Image(isCarOpen ? "tesla_doors" : "tesla_idle")
            .resizable()
            .frame(height: 180)
            .padding(.horizontal)
            .aspectRatio(contentMode: .fit)
    }
    
    var gradient: LinearGradient {
        LinearGradient(colors: [Color("GradientTop"), Color("GradientBottom")], startPoint: .bottom, endPoint: .top)
    }
    var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(0..<controllsArray.count) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                    }
                } label: {
                    Image("\(controllsArray[index])")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fill)
                        .neumorphismSelectedCircleStyle()
                        .overlay {
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color("Background")))
        .neumorphismUnSelectedStyle()
        
    }
    
    var closeCarControllView: some View {
        Button {
            withAnimation {
                isCarOpen.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(isCarOpen ? "Open" : "Clouse")
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: isCarOpen ? "lock.open.fill" : "lock.fill")
                        .renderingMode(.template)
                        .neumorphismSelectedCircleStyle()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius:50).fill(Color("Background")))
                    .neumorphismSelectedStyle()
            }
            .frame(width: 300)
                    
        }
    }
    
    
    var body: some View {
        backgroundStackView {
            VStack{
                headerView
                carView
                controllPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 0{
                    closeCarControllView
                }
                Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
