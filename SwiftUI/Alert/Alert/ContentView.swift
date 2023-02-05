//
//  ContentView.swift
//  Alert
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI


struct ContentView: View {
    @State var isError = false
    
    
    var body: some View {
        Button {
            self.isError = true
        } label: {
            Text("Enter")
        }.actionSheet(isPresented: $isError) {
            ActionSheet(title: Text("Loading"),
                        message: Text("Download photo?"),
                        buttons: [.destructive(Text("Load"), action: {
                print("loading in process...")
            }), .cancel()])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
