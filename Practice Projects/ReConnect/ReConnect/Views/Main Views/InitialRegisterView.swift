//
//  InitialRegisterView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct InitialRegisterView: View {
    
    @ObservedObject var viewModel = RegisterScreenVM.instance
    
    var body: some View {
        if !viewModel.pushToDetailedRegistration {
            RegisterScreen()
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
        } else {
            DetailedRegistrationScreen()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        }
    }
}

struct InitialRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        InitialRegisterView()
    }
}
