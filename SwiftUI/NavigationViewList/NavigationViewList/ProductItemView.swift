//
//  ProductItemView.swift
//  NavigationViewList
//
//  Created by Олег Коваленко on 25.01.2023.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    var body: some View {
        VStack{
            List {
                Section{
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.medium)
                    Text("Опис: " + product.description)
                    Text("Ціна - " + product.price)
                } header: {
                Image(product.imageName)
                        .resizable()
                        .frame(height: 550)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
            }
        }
    }
    
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: .init(imageName: "intenso", title: "Pour Homme Intenso", description: "Нотки: водні ноти, базилік, нагідка, герань", price: "3560 ₴"))
    }
}

