//
//  DrawResultModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

struct DrawResultModel: Decodable {
    let gameId: Int
    let drawId: Int
    let drawTime: TimeInterval
    let winningNumbers: WinningNumbersModel
}
