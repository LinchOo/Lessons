//
//  DetailView.swift
//  NavigationView
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct DetailView : View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    var body: some View {
        VStack(spacing: 30) {
            Text("Buy \(text) \(userBuy.caps) caps")
                .navigationBarItems(leading:
                                        Button("Back"){
                    self.presentation.wrappedValue.dismiss()
                }
                                    , trailing:
                                        HStack {
                    Button("-"){
                        guard self.userBuy.caps > 0 else { return }
                        self.userBuy.caps -= 1
                    }
                    Button("+"){
                        self.userBuy.caps += 1
                    }
                    
                }
                )
        }
        .navigationBarBackButtonHidden(true)
//        onAppear(){
//            self.userBuy.caps = 0
//        }
    }
}
