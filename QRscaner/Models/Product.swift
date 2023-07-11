//
//  Product.swift
//  QRscaner
//
//  Created by Mac Pro on 11.07.2023.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let count: Int
    let imageName: String
    
}
