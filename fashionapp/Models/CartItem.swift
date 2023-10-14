//
//  ProductModelInCart.swift
//  fashionapp
//
//  Created by Hercules Silva on 13/10/23.
//

import Foundation


struct CartItem : Identifiable {
    let id: UUID // id in cart
    var amount: Int
    var product: ProductModel
    var size: String
    
    /**
     addedDate
     updatedAt
     */
    
    init(id: UUID = UUID(), amount: Int = 1, size: String = "L", product: ProductModel) {
        self.id = id
        self.amount = amount
        self.size = size
        self.product = product
    }
}

extension CartItem {
    func total() -> Double {
        return Double(amount) * product.price
    }
}

extension CartItem {
    static let sampleData: [CartItem] = [
//        ProductModel(name: "Smile T-shirt", image: Image("t-shirt-gray"), category: Category(name: "T-shirt")),
//        ProductModel(name: "Airforce Jumpman", image: Image("t-shirt-brown"), category: Category(name: "T-shirt")),
        
        CartItem(amount: 2, product: ProductModel.sampleData[0]),
        CartItem(amount: 1, product: ProductModel.sampleData[2])
        
    ]
}

