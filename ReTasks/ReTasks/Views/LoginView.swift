//
//  LoginView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-07-02.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = AuthVM.viewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
