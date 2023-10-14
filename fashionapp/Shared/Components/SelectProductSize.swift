//
//  SelectProductSize.swift
//  fashionapp
//
//  Created by Hercules Silva on 07/10/23.
//

import SwiftUI

struct SelectProductSize: View {
    let sizes:[String] = ["S", "M", "L"]
    @State private var selectedSize = "S"
    
    func onTap(index: Int) {
        if (selectedSize != sizes[index]) {
            selectedSize = sizes[index]
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Select Size").bold().foregroundColor(AppColors.blackColor)
            HStack {
                ForEach(0..<3) { index in
                    let size = sizes[index]
                    SizeItemView(isSelected: .constant(selectedSize == size), size: size) {
                        onTap(index: index)
                    }
                }
            }
        }
    }
}

struct SizeItemView: View {
    @Binding var isSelected: Bool
    let size: String
    var onTap : () -> Void
        
    var body : some View {
        Button (action: { onTap() }, label: {
            Text(size)
                .font(.system(size: 15))
                .frame(width: 12, height: 12)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.all)
                .background(isSelected ? AppColors.blackColor : AppColors.backgroundGrayColor)
                .cornerRadius(10.0)

        })
        
    }
}

#Preview {
    SelectProductSize()
}
