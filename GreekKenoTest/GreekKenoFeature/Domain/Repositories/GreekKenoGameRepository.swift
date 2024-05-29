//
//  GreekKenoGameRepository.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

protocol GreekKenoGameRepository {
    func loadUpcoming() async -> [NextGame]
    func loadDraw(drawId: Int) async -> NextGame?
    func loadResults(for date: Date) async -> [Result]
}
