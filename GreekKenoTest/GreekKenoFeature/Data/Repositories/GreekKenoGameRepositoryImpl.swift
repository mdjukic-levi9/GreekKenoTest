//
//  GreekKenoGameRepositoryImpl.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

class GreekKenoGameRepositoryImpl: GreekKenoGameRepository {
    private let datasource: GreekKenoGameDataSource

    init(datasource: GreekKenoGameDataSource = GreekKenoGameDataSourceImpl()) {
        self.datasource = datasource
    }

    func loadUpcoming() async -> [NextGame] {
        let result = await datasource.loadUpcoming()

            let result2 = result.map {
            NextGame(drawId: $0.drawId, date: parseTimestamp(timestamp: $0.drawTime))
        }
        return result2
    }
    
    func loadDraw(drawId: Int) async -> NextGame? {
        guard let upcomingDraw = await datasource.loadDraw(drawId: drawId) else {
            return nil
        }
        return NextGame(drawId: upcomingDraw.drawId, date: parseTimestamp(timestamp: upcomingDraw.drawTime))
    }
    
    func loadResults(for date: Date) async -> [Result] {
        await datasource.loadResults(for: date).map {
            Result(drawId: $0.drawId, numbers: $0.winningNumbers.list, drawDateTime: parseTimestamp(timestamp: $0.drawTime))
        }
    }


    private func parseTimestamp(timestamp: TimeInterval) -> Date {
        Date(timeIntervalSince1970: timestamp / 1000)
    }


}
