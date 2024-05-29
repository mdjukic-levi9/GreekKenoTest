//
//  TalonViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import Foundation

final class TalonViewModel: ObservableObject {

    @Published private(set) var selectedNumbers = Set<Int>()
    @Published var maximumReachedAlert = false
    @Published var randomNumbersCount = 1
    let nextGame: NextGame

    private let gameManager = GreekKenoGameManager()


    init(nextGame: NextGame) {
        self.nextGame = nextGame
    }

    var numbers: [Int] {
        return Array(numbersRange)
    }

    var numberOfColumns: Int {
        gameManager.numberOfColumns
    }

    var maxNumbersPlayed: Int {
        gameManager.maxNumbersPlayed
    }

    var radndomGeneratorOptions: [Int] {
        return Array(randomGeneratorRange)
    }

    var deleteButtonOpacity: CGFloat {
        selectedNumbers.isEmpty ? 0 : 1
    }

    func isSelected(number: Int) -> Bool {
        selectedNumbers.contains(number)
    }

    func rowIndex(for number: Int) -> Int {
        gameManager.rowIndex(for: number)
    }

    func text(for number: Int) -> String {
        "\(number)"
    }

    func tappedNumber(_ number: Int, isSelected: Bool) {
        if isSelected {
            guard selectedNumbers.count < gameManager.maxNumbersPlayed else {
                maximumReachedAlert = true
                return
            }
            selectedNumbers.insert(number)
        } else {
            selectedNumbers.remove(number)
        }
    }

    func removeAll() {
        selectedNumbers.removeAll()
    }

    func generateRandom() {
        selectedNumbers.removeAll()
        for _ in 0..<randomNumbersCount {
            var generatedNumber: Int
            repeat{
                generatedNumber = Int.random(in: numbersRange)
            }while(selectedNumbers.contains(generatedNumber))
            selectedNumbers.insert(generatedNumber)
        }
    }

    private var numbersRange: ClosedRange<Int> {
        1...gameManager.numberOfRows * gameManager.numberOfColumns
    }

    private var randomGeneratorRange: ClosedRange<Int> {
        1...8
    }
}
