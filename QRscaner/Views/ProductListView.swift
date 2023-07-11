//
//  ProductListView.swift
//  QRscaner
//
//  Created by Mac Pro on 11.07.2023.
//

import SwiftUI

struct ProductListView: View {
    let products = [
        Product(title: "Product 1", count: 5, imageName: "image1"),
        Product(title: "Product 2", count: 10, imageName: "image2"),
        Product(title: "Product 3", count: 3, imageName: "image3")
    ]

    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedProduct: Product? = nil
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 10) {
                ForEach(products) { product in
                    CustomCell(title: product.title, count: product.count, imageName: product.imageName)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
            }
            .padding()
            .navigationTitle("Список продуктов")
                        .navigationBarItems(trailing: Button(action: {
                            // Действие при нажатии на кнопку "Плюс"
                        }) {
                            Image(systemName: "plus")
                        })
        }
        .sheet(item: $selectedProduct) { product in
            ProductDetailView(product: product)
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

struct CustomCell: View {
    var title: String
    var count: Int
    var imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            Text(title)
                .font(.headline)
                .padding(.top, 5)

            Text("Count: \(count)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 400)
                .cornerRadius(10)
            
            Text(product.title)
                .font(.title)
                .padding()
            
            Text("Count: \(product.count)")
                .font(.subheadline)
            
            Spacer()
        }
    }
}
