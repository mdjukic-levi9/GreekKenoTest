//
//  CircleNumberView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import SwiftUI

struct CircleNumberView: View {
    let text: String
    let isSelected: Bool
    let color: Color
    let selectionHandler: ((Bool)->Void)?

    init(text: String,
         color: Color,
         isSelected: Bool,
         selectionHandler: ((Bool) -> Void)? = nil
    ) {
        self.text = text
        self.isSelected = isSelected
        self.color = color
        self.selectionHandler = selectionHandler
    }

    var body: some View {
        ZStack {
            Color.background
            Circle()
                .fill(Color.backgroundActive)
                .padding(4)
                .opacity(isSelected ? 1.0 : 0.0)
            Text(text)
                .foregroundStyle(isSelected ? Color.foreground: Color.foregroundInactive)
        }
        .overlay(
            Circle()
                .stroke(color, lineWidth: 3)
                .padding(4)
                .opacity(isSelected ? 1.0 : 0.0)
        )
        .onTapGesture {
            withAnimation(.easeOut) {
                selectionHandler?(!isSelected)
            }
        }
    }
}

#Preview {
    CircleNumberView(text: "1",
                    color: Color.TalonColors.color1,
                    isSelected: true,
                    selectionHandler: { _ in })
}
