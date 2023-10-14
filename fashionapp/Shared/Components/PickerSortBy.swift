//
//  SortByPicker.swift
//  fashionapp
//
//  Created by Hercules Silva on 08/10/23.
//

import SwiftUI

struct PickerSortBy: View {
    @State private var selection = "Newest"
    let filters = ["Most Revelant", "Trending", "Newest", "Best Selling"]
    
    var body: some View {
        HStack {
            Text("Sort by")
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.foregroundGrayColor)
            
            Picker("Select Sort", selection: $selection) {
                ForEach(filters, id: \.self) { it in
                    Text(it)
                }
            }
            
            .accentColor(AppColors.blackColor)
            .pickerStyle(.menu)
            .opacity(0.025)
            .padding(.horizontal, 4)
            .overlay(content: {
                Button(action: {}, label: {
                    HStack {
                        Text(selection).fontWeight(.bold).foregroundColor(AppColors.blackColor)
                        Image(systemName: "chevron.down")
                    }.foregroundColor(AppColors.blackColor)
                        .allowsHitTesting(false)
                        .padding(.all, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(AppColors.foregroundGrayColor, lineWidth: 1)
                            
                        )
                })
                
            })
        }
    }
}

#Preview {
    PickerSortBy()
}
