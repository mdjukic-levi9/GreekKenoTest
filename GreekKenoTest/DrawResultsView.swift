//
//  DrawResultsView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct DrawResultsView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Text("Rezultati izvlačenja").foregroundStyle(Color.foreground)
        }
    }
}

#Preview {
    DrawResultsView()
}
