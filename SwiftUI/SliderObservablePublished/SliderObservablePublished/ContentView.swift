//
//  ContentView.swift
//  SliderObservablePublished
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                Double(self.progress)
            }, set: { newValue in
                self.progress = Float(newValue)
                self.viewModel.setTime(value: Float(newValue))
            }), in: 0...viewModel.maxDuration).padding()
            HStack {
            
                Button {
                    self.viewModel.play(nameSong: "hunt")
                    //self.progress = 0.0
                } label: {
                    Text("Play")
                }.frame(width: 100, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                Button {
                    self.viewModel.stop()
                    self.progress = 0.0
                } label: {
                    Text("Pause")
                }.frame(width: 100, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
