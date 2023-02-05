//
//  ContentView.swift
//  ImageAsyncImage
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    let image = UIImage(named: "ava") ?? UIImage()
    
    var body: some View {
        VStack {
            backgroundImageView
            logoImageView
            Text("Magaz")
                .foregroundColor(.white)
                .fontWeight(.bold)
            asyncImageView
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            VStack {
                LinearGradient(colors: [.purple,.purple.opacity(0.2)], startPoint: .top, endPoint: .bottom)
            }
                .ignoresSafeArea(.all,edges: .all)
        )
        
    }
    var asyncImageView: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/401")) {phase in
            switch phase {
            case .empty:
                ProgressView()
                    .accentColor(.accentColor)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            case .failure(let error):
                VStack {
                    Image(systemName: "questionmark")
                    Text(error.localizedDescription)
                        .font(.headline)
                }
            @unknown default:
                fatalError()
            }
        }
    }
    var backgroundImageView: some View {
        Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 200)
            .ignoresSafeArea(.all, edges: .top)
    }
    var logoImageView : some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.white, lineWidth: 4)
            )
            .shadow(radius: 7)
            .offset(y: -165)
            .padding(.bottom, -130)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
