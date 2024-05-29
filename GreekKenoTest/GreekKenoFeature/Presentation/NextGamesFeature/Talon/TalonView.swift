//
//  TalonView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct TalonView: View {

    @ObservedObject private var viewmodel: TalonViewModel

    init(nextGame: NextGame) {
        self.viewmodel = TalonViewModel(nextGame: nextGame)
    }

    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: viewmodel.numberOfColumns)

        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                VStack() {
                    QuotesView(nextGame: viewmodel.nextGame)
                    HStack{
                        Text("Slučajni odabir")
                            .padding()
                            .background(.accent)
                            .foregroundStyle(Color.backgroundActive)
                            .onTapGesture {
                                viewmodel.generateRandom()
                            }
                        Spacer()
                        Text("Brojeva:")
                            .foregroundStyle(Color.foreground)
                        Picker("", selection: $viewmodel.randomNumbersCount) {
                            ForEach(viewmodel.radndomGeneratorOptions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .tint(Color.foreground)
                    }
                    .zIndex(2)
                    if !viewmodel.selectedNumbers.isEmpty {
                        HStack {
                            NumbersView(numbers: viewmodel.selectedNumbers.sorted(), selectionHandler:  { number, isSelected in
                                viewmodel.tappedNumber(number, isSelected: isSelected)
                            })
                            Image(systemName: "trash")
                                .foregroundStyle(.accent)
                                .padding()
                                .onTapGesture {
                                    viewmodel.removeAll()
                                }
                                .opacity(viewmodel.deleteButtonOpacity)
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 0)  {
                        ForEach(viewmodel.numbers, id:\.self) { number in
                            CircleNumberView(
                                text: viewmodel.text(for: number),
                                color: Color.talon(by: viewmodel.rowIndex(for: number)) ,
                                isSelected: viewmodel.isSelected(number: number),
                                selectionHandler: { isSelected in
                                    viewmodel.tappedNumber(number, isSelected: isSelected)
                                }
                            )
                            .border(Color.foregroundInactive, width: 0.5)
                            .aspectRatio(1, contentMode: .fit)
                        }
                    }
                    TalonFooterView(selectedNumbers: viewmodel.selectedNumbers.count, drawTime: viewmodel.nextGame.date)
                }
                .alert("Dozvoljeni broj loptica je \(viewmodel.maxNumbersPlayed)", isPresented: $viewmodel.maximumReachedAlert) {
                    Button("U redu", role: .cancel) { }
                }
            }
            .toolbarBackground(Color.background, for: .navigationBar)
        }
    }
}

#Preview {
    TalonView(nextGame: NextGame(drawId: 123, date: Date(timeIntervalSinceNow: 45)))
}
