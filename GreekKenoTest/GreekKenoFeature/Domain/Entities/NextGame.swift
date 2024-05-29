//
//  NextGame.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class NextGame: Identifiable, ObservableObject {
    let gameId: Int
    let date: Date
    init(gameId: Int, date: Date) {
        self.gameId = gameId
        self.date = date
    }
}
