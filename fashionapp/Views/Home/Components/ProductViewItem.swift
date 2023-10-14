//
//  ProductViewItem.swift
//  fashionapp
//
//  Created by Hercules Silva on 13/10/23.
//

import SwiftUI

struct ProductViewItem: View {
    let product: ProductModel
    
    var body: some View {
        VStack (alignment: .leading) {
            product.imageFromResource()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
            
            Text(product.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.bottom, 1)
                .foregroundColor(AppColors.blackColor)
            
            Text(product.formattedPrice())
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.foregroundGrayColor)
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProductViewItem(product: ProductModel.sampleData[0])
}
