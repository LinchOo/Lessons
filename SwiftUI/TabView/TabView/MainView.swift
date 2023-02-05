//
//  ContentView.swift
//  TabView
//
//  Created by Олег Коваленко on 23.01.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ReceivedView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            SentView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            AccountView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
