//
//  ContentView.swift
//  20_DisclosureGroup+Link+Stepper
//
//  Created by Олег Коваленко on 04.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedColor = Color.black
    @State var fontStyle = Font.Weight.regular
    @State var textOpacityValue = 1.0
    
    var body: some View {
        ScrollView {
            Text("The Swift Developers")
                .foregroundColor(selectedColor)
                .font(.title)
                .fontWeight(fontStyle)
                .padding(.top)
                .opacity(textOpacityValue)
            colorSettingsView
            fontSettingsView
            opacitySettingsView
            readDocView
            Spacer()
        }
    }
    var readDocView: some View {
        DisclosureGroup {
            if let url = URL(string: "https://developer.apple.com/documentation/swiftui/link") {
                Link("Documentation Link" , destination: url)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .padding(.top)
            }
        } label: {
            Text("more")
        }
        .accentColor(.black)
        .padding()
    }
    var opacitySettingsView: some View {
        DisclosureGroup {
            Stepper("Value: \(textOpacityValue.formatted(.percent))") {
                guard textOpacityValue < 1.0 else { return }
                textOpacityValue += 0.1
            } onDecrement: {
                guard textOpacityValue > 0.1 else { return }
                textOpacityValue -= 0.1
            }
            .padding(.top)
        } label: {
            Text("Opacity setting")
        }
        .accentColor(.black)
        .padding()
    }
    
    var fontSettingsView: some View {
        DisclosureGroup {
            ControlGroup{
                Button {
                    fontStyle = Font.Weight.regular
                } label: {
                    Text("Regular")
                }
                Button {
                    fontStyle = Font.Weight.bold
                } label: {
                    Text("Bold")
                }
            }
            .padding(.top)
        } label: {
            Text("Font Style")
        }
        .accentColor(.black)
        .padding()
    }
    var colorSettingsView: some View {
        DisclosureGroup {
            HStack {
                Label {
                    Text("Select Color")
                } icon: {
                    Image(systemName: "paintpalette.fill")
                }
                ColorPicker("", selection: $selectedColor)
            }
            .padding(.top)
        } label: {
            Text("Color Selection")
        }
        .accentColor(.black)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
