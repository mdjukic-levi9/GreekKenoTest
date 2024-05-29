//
//  ResultsResponseModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

struct ResultsResponseModel: Decodable {
    let content: [DrawResultModel]
}
