//
//  NextGamesViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import Foundation

final class NextGamesViewModel: ObservableObject {
    @Published var nextGames = [NextGame]()

    private let repository: GreekKenoGameRepository

    init(repository: GreekKenoGameRepository = GreekKenoGameRepositoryImpl()) {
        self.repository = repository
    }

    func loadData() {
        Task {
            let nextGames = await repository.loadUpcoming()
            DispatchQueue.main.async {
                self.nextGames = nextGames
            }
        }
    }
}
