//
//  GreekKenoGameDataSourceImpl.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

class GreekKenoGameDataSourceImpl: GreekKenoGameDataSource {
    private let gameId: Int
    private let apiUrl: String

    init(gameId: Int = 1100, apiUrl: String = "https://api.opap.gr/draws/v3.0") {
        self.gameId = gameId
        self.apiUrl = apiUrl
    }

    func loadUpcoming() async -> [UpcomingDrawModel] {
        let path = "\(apiUrl)/\(gameId)/upcoming/20"
        guard let url = URL(string: path), let response = try? await URLSession.shared.data(from: url) else{
            return []
        }
        let upcomingGames = try? JSONDecoder().decode([UpcomingDrawModel].self, from: response.0)
        return upcomingGames ?? []
    }
    func loadDraw(drawId: Int) async -> UpcomingDrawModel? {
        let path = "\(apiUrl)/\(gameId)/\(drawId)"
        guard let url = URL(string: path), let response = try? await URLSession.shared.data(from: url) else{
            return nil
        }
        let draw = try? JSONDecoder().decode(UpcomingDrawModel.self, from: response.0)
        return draw
    }

    func loadResults(for date: Date) async -> [DrawResultModel] {
        let dateString = dateServerFormatted(date)
        let path = "\(apiUrl)/\(gameId)/draw-date/\(dateString)/\(dateString)"

        guard let url = URL(string: path), let response = try? await URLSession.shared.data(from: url) else{
            return []
        }
        let resultsResponse = try? JSONDecoder().decode(ResultsResponseModel.self, from: response.0)
        return resultsResponse?.content ?? []
    }

    private func dateServerFormatted(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: date)
    }
}
