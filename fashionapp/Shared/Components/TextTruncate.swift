//
//  TextTruncate.swift
//  fashionapp
//
//  Created by Hercules Silva on 13/10/23.
//

import SwiftUI

struct TextTruncate: View {
    let text = "Soar out the door in the Jordan Jumpman T-Shirt. It's made from soft, comfortable fabric with an easy and relaxed fit. sdasd asdasdddd asdasd"
    
    func copiedText () -> String {
        return text
    }
    
    var body: some View {
        ZStack {
            Text("\(text)...Read More")
                .foregroundColor(AppColors.foregroundGrayColor).background(.red)
//                .overlay(alignment: .bottomTrailing, content: {
//                    Text("...Read More")
//                })
            
            Text("\(text)...Read More")
        }
    }
}

#Preview {
    TextTruncate()
}
