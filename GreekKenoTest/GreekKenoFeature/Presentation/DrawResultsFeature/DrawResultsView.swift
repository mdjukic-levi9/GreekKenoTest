//
//  DrawResultsView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct DrawResultsView: View {

    @StateObject private var viewModel = DrawResultsViewModel()

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            List {
                ForEach(viewModel.results, id: \.drawId) { result in
                    DrawResultView(result: result)
                    .listRowInsets(.some(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                    .listRowBackground(Color.background)
                    .listRowSeparator(.hidden)
                    .padding()
                }
            }
            .background(Color.background)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    DrawResultsView()
}
