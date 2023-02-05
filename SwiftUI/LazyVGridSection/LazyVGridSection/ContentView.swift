//
//  ContentView.swift
//  LazyVGridSection
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct ContentView: View {
    let colums: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, alignment: .center, spacing: nil, pinnedViews: [.sectionHeaders]) {
                profileSection
                photoSection
                    
            }
        }.ignoresSafeArea(.all,edges: .top)
    }
    var photoSection: some View {
        Section {
            ForEach(0..<50) { index in
                Image("ava")
                    .resizable()
                    .frame(height: 150)
                    .cornerRadius(10)
 
            }
        } header: {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "star")
                        .imageScale(.large)
                }
                Spacer()
                Button {
                }label: {
                    Image(systemName: "bandage")
                        .imageScale(.large)
                }
                
            }
            //.frame(height: 120)
            .padding()
            .background(.white)
        }
    }
    var profileSection: some View {
        Section {
            VStack {
                Image("ava")
                    .offset(x: -220,y:80)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                Text("Dog")
                    .fontWeight(.bold)
                
            }
            VStack{
                Text("150")
                    .fontWeight(.bold)
                Text("Subscribers")
                    .fontWeight(.bold)
            }
            VStack{
                Text("120")
                    .fontWeight(.bold)
                Text("Subscribe")
                    .fontWeight(.bold)
            }
        } header: {
            VStack{
                HStack{
                    Spacer()
                    Text("InstaDog")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .offset(y:10)
                .padding()
            }
            .frame(height: 120.0)
            .background(.white)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
