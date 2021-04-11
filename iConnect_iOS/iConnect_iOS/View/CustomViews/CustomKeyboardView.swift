//
//  CustomKeyboardView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-11.
//

import SwiftUI

struct KeyboardView<Content, Toolbar>: View where Content: View, Toolbar: View {
    
    @StateObject private var keyboard: KeyboardResponder = KeyboardResponder()
    let toolbarFrame: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 40.0)
    
    var content: () -> Content
    var toolbar: () -> Toolbar
    
    var body: some View {
        ZStack {
            content()
                .padding(.bottom, (keyboard.currentHeight == 0) ? 0 : toolbarFrame.height)
            
            VStack {
                Spacer()
                toolbar()
                    .frame(width: toolbarFrame.width, height: toolbarFrame.height)
                    .background(Color.secondary)
            }
            .opacity((keyboard.currentHeight == 0) ? 0 : 1)
            .animation(.easeOut)
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeOut)
    }
}
