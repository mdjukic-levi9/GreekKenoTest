//
//  QuotesViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class QuotesViewModel: ObservableObject {

    @Published var drawTime: String = ""
    @Published var gameId: String

    let quotes = [1 : 3.75,
                  2 : 14,
                  3 : 65,
                  4 : 275,
                  5 : 1350,
                  6 : 6500,
                  7 : 25000,
                  8 : 125000
    ]
    init(nextGame: NextGame) {
        self.gameId = "\(nextGame.drawId)"
        self.drawTime = timeformatter.string(from: nextGame.date)
    }

    private var timeformatter: DateFormatter {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter
    }
}
