//
//  TalonFooterView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import SwiftUI

struct TalonFooterView: View {

    @ObservedObject private var viewmodel: TalonFooterViewModel

    init(selectedNumbers: Int, drawTime: Date) {
        self.viewmodel = TalonFooterViewModel(selectedNumbers: selectedNumbers, drawTime: drawTime)
    }

    var body: some View {
        HStack{
            ZStack {
                Circle()
                    .fill(.accent)
                Text(viewmodel.selectedNumbers)
                    .foregroundStyle(Color.backgroundActive)
            }
            .frame(width: 40, height: 40)
            Divider()
                .overlay(Color.foregroundInactive)
                .frame(height: 48)
            Text(viewmodel.remainingTimeTitle)
                .foregroundStyle(Color.foreground)
                .frame(maxWidth: .infinity, alignment: .trailing)
            TimelineView(.periodic(from: .now, by: 1)) { _ in
                Text(viewmodel.remainingTime)
                    .padding()
                    .foregroundStyle(viewmodel.remainingIntervalNearEnd ? Color.warning : Color.foreground)
            }
        }
        .background(Color.background)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TalonFooterView(selectedNumbers: 5, drawTime: Date(timeIntervalSinceNow: 50))
}
