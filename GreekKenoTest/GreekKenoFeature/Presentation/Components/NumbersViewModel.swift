//
//  NumbersViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class NumbersViewModel: ObservableObject {

    let numbers: [Int]

    private let gameManager = GreekKenoGameManager()

    init(numbers: [Int]) {
        self.numbers = numbers
    }

    func text(for number: Int) -> String {
        "\(number)"
    }

    func rowIndex(for number: Int) -> Int {
        gameManager.rowIndex(for: number)
    }

}
