//
//  ProductModel.swift
//  fashionapp
//
//  Created by Hercules Silva on 25/09/23.
//

import Foundation
import SwiftUI

struct ProductModel : Identifiable {
    let id: UUID
    var name: String
    var brand: String
    var price: Double = 0.0
    var image: Image?
    var category: Category
    
    init(id: UUID = UUID(), name: String, brand: String, price: Double = 88.8, image: Image? = Image(systemName: "globe"), category: Category) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.image = image
        self.category = category
    }
    
    func imageFromResource () -> Image {
        return (image == nil) ? Image("t-shirt-black") : image!
    }
}

extension ProductModel {
    struct Category: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    func formattedPrice () -> String {
        return "$\(price.rounded())"
    }
}

extension ProductModel {
    static let sampleData: [ProductModel] = [
        ProductModel(name: "Smile T-shirt", brand: "Nike", image: Image("t-shirt-gray"), category: Category(name: "T-shirt")),
        ProductModel(name: "Airforce Jumpman", brand: "Nike", image: Image("t-shirt-brown"), category: Category(name: "T-shirt")),
        ProductModel(name: "Save Planet", brand: "Nike", image: Image("t-shirt-white"), category: Category(name: "Polo")),
        ProductModel(name: "SwiftUI T-shirt", brand: "Nike", image: Image("t-shirt-stripped"), category: Category(name: "T-shirt"))
    ]
    
    static let sampleAvailableCategory: [Category] = [
        Category(name: "Polo"),
        Category(name: "Coat"),
        Category(name: "Blazer"),
        Category(name: "T-shirt"),
    ]
}
