//
//  View+OnAppearDetector.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-07-06.
//

import SwiftUI

#if os(iOS)
struct OnScrolledOutOfScrollView: ViewModifier {
    @Binding var isScrolledOutOfView: Bool
    var threshold: CGFloat = 0.0

    // This prevents the view from appearing when the parent view first appeared
    @State private var isInitialCheckCompleted = false

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            isInitialCheckCompleted = true
                            isScrolledOutOfView = false
                        }
                        .onChange(of: proxy.frame(in: .global).minY) { _ in
                            if isInitialCheckCompleted {
                                checkVisibility(with: proxy)
                            }
                        }
                        .onChange(of: proxy.frame(in: .global).maxY) { _ in
                            if isInitialCheckCompleted {
                                checkVisibility(with: proxy)
                            }
                        }
                }
            )
    }

    private func checkVisibility(with proxy: GeometryProxy) {
        let frame = proxy.frame(in: .global)
        let screenHeight = UIScreen.main.bounds.height

        let isViewOnScreen = frame.minY < screenHeight - (frame.height * threshold) && frame.maxY > (frame.height * threshold)

        if isScrolledOutOfView != !isViewOnScreen {
            isScrolledOutOfView = !isViewOnScreen
        }
    }
}

extension View {
    func onScrolledOutOfView(_ isScrolledOutOfView: Binding<Bool>, threshold: CGFloat = 0.0) -> some View {
        self.modifier(OnScrolledOutOfScrollView(isScrolledOutOfView: isScrolledOutOfView, threshold: threshold))
    }
}
#endif
