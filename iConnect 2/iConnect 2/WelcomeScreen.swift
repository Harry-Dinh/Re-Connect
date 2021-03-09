//
//  Home.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to iConnect")
                .font(.largeTitle)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct WelcomeScreenPreview: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
