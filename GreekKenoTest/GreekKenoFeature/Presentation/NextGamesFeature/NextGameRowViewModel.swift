//
//  NextGameRowViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import Foundation

final class NextGameRowViewModel: ObservableObject {
    @Published var drawTime: String = ""
    private let nextGame: NextGame

    init(nextGame: NextGame) {
        self.nextGame = nextGame
        self.drawTime = timeformatter.string(from: nextGame.date)
    }

    var remainingInterval: String {
        nextGame.date.timeIntervalSinceNow.remainingTime()
    }

    var remainingIntervalNearEnd: Bool {
        nextGame.date.timeIntervalSinceNow < 46
    }


    private var timeformatter: DateFormatter {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter
    }
}
