//
//  ContentView.swift
//  CustomTabViewPreferenceKey
//
//  Created by Олег Коваленко on 07.02.2023.
//

import SwiftUI

struct TabItemPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}

struct TabItemModifire: ViewModifier {
    let tabBarItem: TabItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBarItem])
    }
}

struct TabItem: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var icon: String
}

extension View {
    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifire(tabBarItem: label()))
    }
}

struct CustomTabView<Content: View>: View {
    @Binding var selection: Int
    
    @Namespace private var tabBarItem
    
    @State private var tabs: [TabItem] = [
        .init(text: "Home", icon: "house.fill"),
        .init(text: "Favorites", icon: "star.fill")]
    
    private var content: Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            HStack{
                tabsView
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical, 5)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding()
        }
        .onPreferenceChange(TabItemPreferenceKey.self) {value in
            self.tabs = value
        }
    }
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
    private var tabsView: some View{
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            Spacer()
            VStack(spacing: 5) {
                Image(systemName: element.icon)
                Text(element.text)
                    .font(.system(size: 10))
            }
            .foregroundColor(selection == index ? .black : .gray)
            .background(
                ZStack{
                    if selection == index {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow.opacity(0.4))
                            .frame(width: 70, height: 50)
                            .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    selection = index
                }
            }
            Spacer()
        }
        
    }
}

struct ContentView: View {
    @State var selection = 0
    
    var body: some View {
        CustomTabView(selection: $selection) {
            Color.red
                .myTabItem {
                    TabItem(text: "Home", icon: "house.fill")
                }
                .opacity(selection == 0 ? 1 : 0)
            Color.green
                .myTabItem {
                    TabItem(text: "Favorites", icon: "star.fill")
                }
                .opacity(selection == 1 ? 1 : 0)
            Color.blue
                .myTabItem {
                    TabItem(text: "Settings", icon: "gearshape.fill")
                }
                .opacity(selection == 2 ? 1 : 0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selection: 0)
    }
}
