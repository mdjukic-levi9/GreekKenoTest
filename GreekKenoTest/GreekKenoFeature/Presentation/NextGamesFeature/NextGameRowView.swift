//
//  NextGameRowView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import SwiftUI

struct NextGameRowView: View {
    
    @ObservedObject private var viewmodel: NextGameRowViewModel

    init(nextGame: NextGame) {
        self.viewmodel = NextGameRowViewModel(nextGame: nextGame)
    }

    var body: some View {
        HStack {
            Text(viewmodel.drawTime)
                .foregroundStyle(Color.foreground)
            Spacer()
            TimelineView(.periodic(from: .now, by: 1)) { _ in
                Text(viewmodel.remainingInterval)
                    .foregroundStyle(viewmodel.remainingIntervalNearEnd ? Color.warning : Color.foreground)
            }
        }
        .background(Color.background)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NextGameRowView(nextGame: NextGame(gameId: 123, date: Date(timeIntervalSinceNow: 45)))
}
