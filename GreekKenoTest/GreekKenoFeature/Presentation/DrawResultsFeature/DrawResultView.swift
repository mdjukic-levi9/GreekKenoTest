//
//  DrawResultView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import SwiftUI

struct DrawResultView: View {

    @ObservedObject private var viewmodel: DrawResultViewModel

    init(result: Result) {
        self.viewmodel = DrawResultViewModel(result: result)
    }

    var body: some View {
        VStack {
            Text("Vreme izvlačenja \(viewmodel.drawDateTime) | Kolo \(viewmodel.gameId)")
                .padding()
                .background(Color.backgroundActive)
                .foregroundStyle(Color.foreground)
            NumbersView(numbers: viewmodel.numbers)
        }
        .background(Color.background)
    }
}

#Preview {
    DrawResultView(result: Result(gameId: 123, numbers: [1, 11, 34, 57], drawDateTime: Date()))
}
