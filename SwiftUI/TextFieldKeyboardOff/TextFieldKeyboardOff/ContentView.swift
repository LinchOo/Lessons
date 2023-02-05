//
//  ContentView.swift
//  TextFieldKeyboardOff
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var login = ""
    @State var pass = ""
    @FocusState var nameIsFocused: Bool //hide keyboard IOS.ver >= 15
    
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Enter Login", text: $login) { changerd in
                print("onChanged")
            } onCommit: {
                print("onComit")
            } .TextFieldCSS()   // CSS Style mod
                .focused($nameIsFocused) //hide keyboard IOS.ver >= 15
            TextField("Enter Passowrd", text: $pass) .TextFieldCSS() .focused($nameIsFocused)// CSS Style mod
            Button {
                nameIsFocused = false //hide keyboard IOS.ver >= 15
                //hideKeyboard() //hide keyboard IOS.ver < 15
            } label: {
                Text("Login")
            }
        }.padding().onTapGesture {
            print("ASD")
            nameIsFocused = false
        }
    }
}

//MARK: Hide Keyboard IOS.ver < 15
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
//MARK: Text Filed Modifier CSS Style
extension View {
    func TextFieldCSS() -> some View {
        modifier(TextFieldModifier())
    }
}
struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .background(Color.gray)
            .foregroundColor(.accentColor)
            .font(.system(size: 24))
    }
    
}


//---------////---------////---------////---------//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
