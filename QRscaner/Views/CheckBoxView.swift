//
//  CheckBoxView.swift
//  QRscaner
//
//  Created by Mac Pro on 11.07.2023.
//

import SwiftUI
struct CheckBoxView: View {
    @State private var selectedTab: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    Spacer()
                    
                    NavigationLink(
                        destination: ProductListView(),
                        tag: 1,
                        selection: $selectedTab
                    ) {
                        Text("Список продуктов")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        // Действие, которое нужно выполнить при нажатии на вторую кнопку
                    }) {
                        Text("Добавить продукт")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(
                    destination: ScanerView(),
                    tag: 2,
                    selection: $selectedTab
                ) {
                    Text("Сканировать QR")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("CheckBox")
                        .font(.headline)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
