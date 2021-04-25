//
//  CoreScreen.swift
//  iConnect
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI

struct CoreScreen: View {
    
    @ObservedObject var viewModel = AuthVM.shared
    
    var body: some View {
        NavigationView {
            Button("Sign Out") {
                viewModel.signOutCurrentUser()
            }
        }
    }
}

struct CoreScreenPreview: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
