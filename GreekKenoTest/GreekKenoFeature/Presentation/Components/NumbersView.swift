//
//  NumbersView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/29/24.
//

import SwiftUI

struct NumbersView: View {

    let selectionHandler: ((Int, Bool)->Void)?

    @ObservedObject private var viewmodel: NumbersViewModel

    init(numbers: [Int],
         selectionHandler: ((Int, Bool) -> Void)? = nil) {
        self.selectionHandler = selectionHandler
        self.viewmodel = NumbersViewModel(numbers: numbers)
    }

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 0) {
            ForEach(viewmodel.numbers, id:\.self) { number in
                CircleNumberView(
                    text: viewmodel.text(for: number),
                    color: Color.talon(by: viewmodel.rowIndex(for: number)),
                    isSelected: true,
                    selectionHandler: { isSelected in
                        selectionHandler?(number, isSelected)
                    }
                )
                .aspectRatio(1, contentMode: .fit)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NumbersView(numbers: [1, 11, 23,44, 76])
}
