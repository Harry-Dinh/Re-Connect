//
//  WelcomeScreen.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-08.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @ObservedObject var viewModel = WelcomeScreenVM.shared
    
    var body: some View {
        VStack {
            LogoView(imageName: "checkmark.square", imageSize: 100, displayColor: .accentColor)
            
            CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
            
            Text(viewModel.title)
                .font(.title)
                .bold()
            
            Text(viewModel.subtitle)
                .foregroundColor(.secondary)
                .padding()
            
            Button(action: {
                viewModel.isSignedIn = true
            }, label: {
                Text("Get Started")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
            })
        }
        .navigationBarHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .previewDevice("iPhone 12")
    }
}
