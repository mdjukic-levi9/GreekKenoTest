//
//  NextGamesView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/28/24.
//

import SwiftUI

struct NextGamesView: View {

    @StateObject private var viewmodel = NextGamesViewModel()

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewmodel.nextGames, id: \.drawId) { nextGame in
                        NextGameRowView(nextGame: nextGame)
                            .background(
                                NavigationLink("", destination: TalonView(nextGame: nextGame))
                                    .opacity(0)
                            )
                            .listRowBackground(Color.background)
                            .listRowSeparatorTint(Color.foregroundInactive)
                    }
                } header: {
                    VStack {
                        HStack {
                            Image("greek_flag").resizable().frame(width: 35, height: 21)
                            Text("GRČKI KINO (20/80)").foregroundStyle(Color.foreground)
                            Spacer()
                        }
                        Divider().overlay(Color.foreground)
                        HStack {
                            Text("Vreme izvlačenja").foregroundStyle(Color.foreground)
                            Spacer()
                            Text("Preostalo za uplatu").foregroundStyle(Color.foreground)
                        }
                    }
                    .listRowInsets(.some(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                    .padding()
                    .background(Color.foregroundInactive)
                }
            }
            .navigationTitle("")
            .clipped()
            .background(Color.background)
            .listStyle(.plain)
            .onAppear {
                viewmodel.loadData()
            }
        }
    }

}

#Preview {
    NextGamesView()
}
