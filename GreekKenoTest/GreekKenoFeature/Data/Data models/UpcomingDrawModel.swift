//
//  UpcomingDrawModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

struct UpcomingDrawModel: Decodable {
    let gameId: Int
    let drawId: Int
    let drawTime: TimeInterval
}
