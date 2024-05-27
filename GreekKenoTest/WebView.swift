//
//  WebView.swift
//  GreekKenoTest
//
//  Created by Marko Djukic on 5/27/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var reload: Bool
    private let webview = WKWebView()

    func makeUIView(context: Context) -> WKWebView  {
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if reload {
            loadUrl()
            DispatchQueue.main.async {
                self.reload = false
            }
        }
    }

    private func loadUrl() {
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
