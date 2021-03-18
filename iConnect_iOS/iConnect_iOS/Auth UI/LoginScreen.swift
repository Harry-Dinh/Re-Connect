//
//  LoginScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var showRegisterScreen = false
    
    var body: some View {
        VStack {
            Button("Register") {
                showRegisterScreen.toggle()
            }
            .sheet(isPresented: $showRegisterScreen, content: {
                RegisterScreen()
            })
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
