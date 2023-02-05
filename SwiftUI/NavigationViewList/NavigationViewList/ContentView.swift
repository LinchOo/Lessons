//
//  ContentView.swift
//  NavigationViewList
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let price: String
}

struct ContentView: View {
    
    var products: [Product] = [
        .init(imageName: "intenso", title: "Pour Homme Intenso", description: "Нотки: водні ноти, базилік, нагідка, герань", price: "3560 ₴"),
        .init(imageName: "k", title: "K by Dolce & Gabbana", description: "Нотки : цитрусові, червоний апельсин, шишкоягоди ялівця", price: "2210 ₴"),
        .init(imageName: "homme", title: "Pour Homme", description: "Нотки: бергамот, мандарин, неролі", price: "2240 ₴"),
        .init(imageName: "man", title: "The One for Men", description: "Нотки: базилік, коріандр, грейпфрут", price: "2370 ₴")
    ]
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                NavigationLink {
                    ProductItemView(product: product)
                } label: {
                    makeProductCellView(product: product)
                }
                .swipeActions(edge: .leading) {
                    Button{
                    } label: {
                        Image(systemName: "star")
                    }
                    .tint(.yellow)
                }
                .listRowSeparator(.hidden)
            }
            .refreshable {
            }
            .navigationTitle("Парфумерія")
            .toolbar{ EditButton()}
        }
    }
    func makeProductCellView(product: Product) -> some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 110, height: 220)
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
            // .cornerRadius(8)
            
            VStack(alignment: .leading) {
                
                Text(product.title).lineLimit(1)
                Text(product.description)
                    .foregroundColor(.gray)
                    .font(.caption2)
                    .fontWeight(.light)
                    .padding(.bottom)
                
                Text(product.price)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
