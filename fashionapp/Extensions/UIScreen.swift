//
//  UIScreen.swift
//  fashionapp
//
//  Created by Hercules Silva on 26/09/23.
//

import SwiftUI

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    static let percentage = UIScreen.main.bounds.width
    
    static func width(percentage: CGFloat) -> CGFloat {
        return screenWidth * percentage
    }
    
    static func height(percentage: CGFloat) -> CGFloat {
        return screenHeight * percentage
    }
}
