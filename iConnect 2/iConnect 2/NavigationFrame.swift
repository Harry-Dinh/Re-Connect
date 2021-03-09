//
//  Home.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct NavigationFrame: View {
    var body: some View {
        NavigationView {
            NavigationList()
            WelcomeScreen()
        }
    }
}

struct NavigationFramePreviews: PreviewProvider {
    static var previews: some View {
        NavigationFrame()
    }
}
