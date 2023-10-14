//
//  CornerRoundedRectangle.swift
//  fashionapp
//
//  Created by Hercules Silva on 09/10/23.
//

import SwiftUI

struct RoundedCorner: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .stroke(AppColors.foregroundGrayColor, lineWidth: 1)
    }
}

#Preview {
    RoundedCorner()
}
