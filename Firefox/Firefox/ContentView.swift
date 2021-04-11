//
//  ContentView.swift
//  Firefox
//
//  Created by Harry Dinh on 2021-04-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Pass the url to the SafariWebView struct.
        SafariWebView(mesgURL: "https://google.com/")
    }
}
struct SafariWebView: View {
    @ObservedObject var model: WebViewModel

    init(mesgURL: String) {
        //Assign the url to the model and initialise the model
        self.model = WebViewModel(link: mesgURL)
    }
    
    var body: some View {
        //Create the WebView with the model
        SwiftUIWebView(viewModel: model)
    }
}
