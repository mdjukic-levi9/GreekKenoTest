//
//  DrawResultsViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class DrawResultsViewModel: ObservableObject {

    @Published var results: [Result] = []

    private var repository: GreekKenoGameRepository

    init(repository: GreekKenoGameRepository = GreekKenoGameRepositoryImpl()) {
        self.repository = repository
    }

    func loadData() {
        Task {
            let results = await repository.loadResults(for:Date())
            DispatchQueue.main.async {
                self.results = results
            }
        }
    }

}
