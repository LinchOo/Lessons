//
//  ContentView.swift
//  TextEditorProgressViewOnChenge
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    @State var totalTextCharsCount = 0
    @State var limitedText = ""
    
    init(){
        UITextView.appearance().backgroundColor = UIColor.clear
    }
    var body: some View {
        VStack {
            ProgressView("Chars: \(totalTextCharsCount) / 90", value: Double(totalTextCharsCount), total: 90)
                .frame(width: 150)
                .padding()
                .foregroundColor(.white)
                .accentColor(.white)
            TextEditor(text: $text)
                .padding()
                .background(Color.yellow.opacity(0.5))
                .foregroundColor(.white)
                .font(Font.custom("AvenirNext-Refular", size: 20, relativeTo: .body))
                .frame(width: 300, height: 250)
                .cornerRadius(25)
                .onChange(of: text) { text in
                    totalTextCharsCount = text.count
                    if totalTextCharsCount <= 90 {
                        limitedText = text
                    }else {
                        self.text = limitedText
                    }
                }
                Spacer()
        }
        .padding()
        .background(.purple)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
