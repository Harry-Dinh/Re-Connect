//
//  WebView.swift
//  iConDiscovery_iOS
//
//  Created by Harry Dinh on 2021-07-09.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var pageURL: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if pageURL.isEmpty {
            print("Page URL is empty.")
        }
        else {
            let request = URLRequest(url: URL(string: pageURL)!)
        }
    }
}
