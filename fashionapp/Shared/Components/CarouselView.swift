//
//  CarouselView.swift
//  fashionapp
//
//  Created by Hercules Silva on 05/10/23.
//

import SwiftUI

struct CarouselView: View {
    var items: [AnyView]
    var height: CGFloat? = 400
    
    @State private var index = 0
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(items.count.range, id: \.self) { position in
                items[position]
                
//                ProductModel.sampleData.first?.imageFromResource()
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(12)
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        // - init - its works! that's it! ¯\_(ツ)_/¯
        .frame(height: height)
        .padding()
        .background(AppColors.backgroundGrayColor)
        .frame(height: height)
        .background(AppColors.backgroundGrayColor)
        // - end
        
        .overlay(alignment: .bottom, content: {
            HStack(spacing: 5) {
                let circleSize: CGFloat = 8
                ForEach(items.count.range, id: \.self) { position in
                    Circle()
                        .fill(position == self.index ? .indigo : .white)
                        .frame(width: circleSize, height: circleSize)
                }
            }.padding(.bottom, 4)
        })
    }
}

#Preview {
    VStack {
        CarouselView(items: [AnyView(Text("1")), AnyView(Text("2")), AnyView(Text("3"))])
        HStack {
            Text("a;smd")
        }.background(.red)
    }
}
