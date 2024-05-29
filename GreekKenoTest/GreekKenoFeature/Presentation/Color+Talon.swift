//
//  Color+Talon.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import SwiftUI

extension Color {
    static func talon(by index: Int) -> Color {

        let colors = [Color.TalonColors.color0,
                      Color.TalonColors.color1,
                      Color.TalonColors.color2,
                      Color.TalonColors.color3,
                      Color.TalonColors.color4,
                      Color.TalonColors.color5,
                      Color.TalonColors.color6,
                      Color.TalonColors.color7
        ]

        guard 0..<colors.count ~= index else {
            return Color.white.opacity(0)
        }
        return colors[index]
    }
}
