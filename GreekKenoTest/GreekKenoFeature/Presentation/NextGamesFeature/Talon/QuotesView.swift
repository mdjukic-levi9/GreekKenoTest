//
//  QuotesView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import SwiftUI

struct QuotesView: View {

    @ObservedObject private var viewmodel: QuotesViewModel

    init(nextGame: NextGame) {
        viewmodel = QuotesViewModel(nextGame: nextGame)
    }

    var body: some View {
        VStack {
            Text("Vreme izvlačenja: \(viewmodel.drawTime) | Kolo: \(viewmodel.gameId)")
                .padding()
                .foregroundStyle(Color.foreground)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                VStack(alignment: .leading, spacing: 16) {
                    Text("B.K.").foregroundStyle(Color.foreground)
                    Text("Kvota").foregroundStyle(Color.foreground)
                }
                ScrollView(.horizontal) {
                    VStack {
                        HStack{
                            ForEach(viewmodel.quotes.sorted(by: { $0.key < $1.key} ), id: \.self.key) { key, value in
                                Text("\(key)")
                                    .foregroundStyle(Color.foreground)
                                    .frame(width:100)
                            }
                        }
                        Divider()
                            .overlay(.foregroundInactive)
                        HStack{
                            ForEach(viewmodel.quotes.sorted(by: { $0.key < $1.key} ), id: \.self.key) { key, value in
                                Text("\(value, specifier: "%.2f")")
                                    .foregroundStyle(Color.foreground)
                                    .frame(width:100)
                            }
                        }
                    }

                }
            }
            .padding()
            .frame(height: 100)
        }
        .background(Color.background)
    }
}

#Preview(traits:.sizeThatFitsLayout) {
    QuotesView(nextGame: NextGame(drawId: 1, date: Date(timeIntervalSinceNow: 65)))
}
