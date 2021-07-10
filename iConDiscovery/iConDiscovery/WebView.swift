//
//  WebView.swift
//  iConDiscovery
//
//  Created by Harry Dinh on 2021-07-09.
//

import SwiftUI
import WebKit

class Observable: ObservableObject {
    @Published var observation: NSKeyValueObservation?
    @Published var loggedIn = false
}


struct WebView: NSViewRepresentable {
    var pageURL: String
    @ObservedObject var observe = Observable()
    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ uiView: WKWebView, context: Context) {
        observe.observation = uiView.observe(\WKWebView.title, options: .new) { view, change in
            if let title = view.title {
                observe.loggedIn = true
                print("Page loaded: \(title)")
            }
        }
        
        uiView.load(pageURL)
    }
}


extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
