//
//  LiveDrawView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI

struct LiveDrawView: View {
    
    private let urlString = "https://www.mozzartbet.com/sr/lotto-animation/26#/"
    
    @State private var reload = false
    
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            if let url = URL(string: urlString) {
                WebView(url: url, reload: $reload)
            }
        }
        .onAppear{
            reload = true
        }

    }
}

#Preview {
    LiveDrawView()
}

