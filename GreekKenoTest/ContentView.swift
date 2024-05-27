//
//  ContentView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TalonView()
                .tabItem {
                    Label("Talon", systemImage: "square.grid.2x2")
                        .environment(\.symbolVariants, .none)
                }
            LiveDrawView()
                .tabItem {
                    Label("Izvlačenje uživo", systemImage: "play.circle")
                        .environment(\.symbolVariants, .none)
                }
            DrawResultsView()
                .tabItem {
                    Label("Rezultati izvlačenja", systemImage: "r.circle")
                        .environment(\.symbolVariants, .none)
                }
        }
    }
}

#Preview {
    ContentView()
}
