//
//  TalonView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct TalonView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Text("Talon").foregroundStyle(Color.foreground)
        }
    }
}

#Preview {
    TalonView()
}
