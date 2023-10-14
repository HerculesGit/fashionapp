//
//  StarReview.swift
//  fashionapp
//
//  Created by Hercules Silva on 07/10/23.
//

import Foundation
import SwiftUI

struct StarReview: View {
    let stars: CGFloat
    
    var body: some View {
        let intStars = Int(stars)
        let remaining = max(intStars, 5) - min(intStars, 5)
        
        
        VStack (alignment: .trailing) {
            HStack (spacing: 4) {
                ForEach(intStars.range) { index in
                    StarImage(isFilled: true)
                }
                
                ForEach(remaining.range) { index in
                    StarImage(isFilled: false)
                }
                
            }
            Text("(2400+ reviews)").font(.callout).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(AppColors.foregroundGrayColor)
        }
    }
}

struct StarImage: View {
    let starSize: CGFloat = 14
    let isFilled: Bool
    
    var body: some View {
        Image(systemName: isFilled ? "star.fill" : "star")
            .resizable()
            .foregroundColor(isFilled ? .yellow : .gray)
            .aspectRatio(contentMode: .fit)
            .frame(height: starSize)
    }
}

#Preview {
    StarReview(stars: 4)
}
