//
//  CustomStepper.swift
//  fashionapp
//
//  Created by Hercules Silva on 07/10/23.
//

import SwiftUI

struct CustomStepper: View {
    @State var stepperValue: Int
    
    let btnSize: CGFloat = 16
    
    func increaseStep() {
        stepperValue+=1
    }
    
    func decrementStep() {
        if (stepperValue > 1) {
            stepperValue-=1
        }
    }
    
    init(stepperValue: Int = 1) {
        self.stepperValue = stepperValue
    }
    
    var body: some View {
        HStack() {
            Button(action: {
                decrementStep()
            }, label: {
                Image(systemName: "minus")
                    .frame(width: btnSize, height: btnSize)
                    .padding(.all, 10)
                    .foregroundColor(.black)
                    .padding(.all, 4)
            })
            Text("\(stepperValue)").bold().foregroundColor(AppColors.blackColor)
            Button(action: {
                increaseStep()
            }, label: {
                Image(systemName: "plus")
                    .frame(width: btnSize, height: btnSize)
                    .padding(.all, 10)
                    .foregroundColor(.black)
                    .padding(.all, 4)
            })
        }
        .background(.gray.opacity(0.15))
        .cornerRadius(8)
    }
}

#Preview {
    CustomStepper(stepperValue: 4)
}
