//
//  CoreScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-19.
//

import SwiftUI

struct CoreScreen: View {
    var body: some View {
        Button("Sign Out") {
            LoginVM.shared.signOutCurrentUser()
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
