//
//  DrawResultViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class DrawResultViewModel: ObservableObject {

    @Published var gameId: String
    @Published var numbers: [Int]
    @Published var drawDateTime: String = ""


    init(result: Result) {
        gameId = "\(result.gameId)"
        numbers = result.numbers
        drawDateTime = formatDateTime(date: result.drawDateTime)
    }

    private func formatDateTime(date: Date) -> String {
        dateFormatter.string(from: date)
    }

    private var dateFormatter: DateFormatter {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd.MM.yyyy. HH:mm"
        return timeFormatter
    }
}
