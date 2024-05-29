//
//  NextGamesViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import Foundation

final class NextGamesViewModel: ObservableObject {
    @Published var nextGames = [NextGame]()

    func loadData() {
        #warning("Fetch real data")
        nextGames = Array(repeating: NextGame(gameId: 1, date: Date().addingTimeInterval(50)), count: 20)
    }
}
