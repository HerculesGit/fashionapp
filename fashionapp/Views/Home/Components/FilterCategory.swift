//
//  FilterCategory.swift
//  fashionapp
//
//  Created by Hercules Silva on 13/10/23.
//

import SwiftUI

struct FilterCategory: View {
    let onTap: (String) -> Void
    let categories = ProductModel.sampleAvailableCategory.map { $0.name }
    
    @State var selectedCategoryFilter: String = "Polo"
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    let backgroundColor = selectedCategoryFilter == category ? AppColors.blackColor : AppColors.backgroundGrayColor
                    
                    let textColor = selectedCategoryFilter == category ? .white : AppColors.foregroundGrayColor
                    
                    Text(category)
                        .font(.headline)
                        .padding()
                        .background(backgroundColor)
                        .cornerRadius(12)
                        .foregroundColor(textColor)
                        .onTapGesture {
                            selectedCategoryFilter = category
                            onTap(selectedCategoryFilter)
                        }
                }
            }
            .onAppear {
                
            }
        }
    }
}

#Preview {
    FilterCategory { category in
        
    }
}
