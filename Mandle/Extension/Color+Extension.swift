//  Color+Extension.swift
//  Mandle
//  Created by 최연주 on 8/7/24.

import SwiftUI


// hex code converter from rgb
extension Color {
    static let slider = Color(hex: "2B3C2F")
    static let buttonOn = Color(hex: "837566")
    static let buttonOff = Color(hex: "F2F1EE")
    static let recButton = Color(hex: "949688")
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
