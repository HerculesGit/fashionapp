//
//  color.swift
//  fashionapp
//
//  Created by Hercules Silva on 21/09/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        // Remove any leading '#' or '0x' from the hex string
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")
        cleanedHex = cleanedHex.replacingOccurrences(of: "0x", with: "")

        // Check if the cleanedHex string has 6 characters
        if cleanedHex.count == 6 {
            // Parse the R, G, and B components
            let scanner = Scanner(string: cleanedHex)
            var rgb: UInt64 = 0

            if scanner.scanHexInt64(&rgb) {
                let red = Double((rgb & 0xFF0000) >> 16) / 255.0
                let green = Double((rgb & 0x00FF00) >> 8) / 255.0
                let blue = Double(rgb & 0x0000FF) / 255.0

                // Create the Color
                self.init(red: red, green: green, blue: blue)
                return
            }
        }

        // If parsing fails, create a default color (e.g., black)
        self.init(white: 0.0)
    }
}
