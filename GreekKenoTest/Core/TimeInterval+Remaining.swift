//
//  TimeInterval+Remaining.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import Foundation

extension TimeInterval{

    func remainingTime() -> String {

        let time =  Int(max(0, self))

        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)

        if hours == 0 {
            return String(format: "%0.2d:%0.2d",minutes,seconds)
        }

        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)

    }
}
