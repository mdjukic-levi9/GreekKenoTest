//
//  TalonFooterViewModel.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

final class TalonFooterViewModel: ObservableObject {
    @Published var selectedNumbers: String
    @Published var remainingTimeTitle: String
    private let drawTime: Date

    init(selectedNumbers: Int, drawTime: Date) {
        self.selectedNumbers = "\(selectedNumbers)"
        self.remainingTimeTitle = "Preostalo vreme za uplatu "
        self.drawTime = drawTime
    }

    var remainingTime: String {
        "\(drawTime.timeIntervalSinceNow.remainingTime())"
    }

    var remainingIntervalNearEnd: Bool {
        drawTime.timeIntervalSinceNow < 46
    }

}
