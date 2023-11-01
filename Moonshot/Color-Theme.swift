//
//  Color-Theme.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/1/23.
//

import SwiftUI


extension ShapeStyle where Self == Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var hexDarkBackground: Color {
        // hex code representation of the darkBackground defined above
        Self(hex: "#1A1A33")
    }
    
    static var hexLightBackground: Color {
        // hex code representation of the lightBackground defined above
        Self(hex: "#333344")
    }
}
