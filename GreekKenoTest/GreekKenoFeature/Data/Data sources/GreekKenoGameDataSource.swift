//
//  GreekKenoGameDataSource.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

protocol GreekKenoGameDataSource {
    func loadUpcoming() async -> [UpcomingDrawModel]
    func loadDraw(drawId: Int) async -> UpcomingDrawModel?
    func loadResults(for date: Date) async -> [DrawResultModel]
}
