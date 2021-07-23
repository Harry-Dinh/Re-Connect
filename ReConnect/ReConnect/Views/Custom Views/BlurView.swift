//
//  BlurView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import Foundation
import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: colorScheme == .light ? .systemThinMaterialLight : .systemThinMaterialDark))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: colorScheme == .light ? .systemThinMaterialLight : .systemThinMaterialDark)
    }
}
