//
//  BlurView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> UIView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: colorScheme == .light ? .light : .dark))
        return blurView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // No operation
    }
}
