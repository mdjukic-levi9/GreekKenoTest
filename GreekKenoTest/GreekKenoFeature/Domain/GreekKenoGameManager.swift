//
//  GreekKenoGameManager.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class GreekKenoGameManager {
    let maxNumbersPlayed: Int
    let numberOfColumns: Int
    let numberOfRows: Int

    init(maxNumbersPlayed: Int = 15, numberOfColumns: Int = 10, numberOfRows: Int = 8) {
        self.maxNumbersPlayed = maxNumbersPlayed
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
    }

    func rowIndex(for number: Int) -> Int {
        (number - 1)  / numberOfColumns
    }
}
