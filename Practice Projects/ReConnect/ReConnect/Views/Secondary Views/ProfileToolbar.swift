//
//  ProfileToolbar.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-07-03.
//

import SwiftUI

struct ProfileToolbar: View {
    @Environment(\.colorScheme) private var colorScheme

    private let toolbarMinHeight: CGFloat = 50.0
    private let backgroundShadowRadius: CGFloat = 50.0
    private let bottomPadding: CGFloat = 5.0

    var body: some View {
        mainContent
            .padding(.bottom, bottomPadding)
    }

    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(.ultraThinMaterial)
            .frame(maxHeight: toolbarMinHeight)
    }

    private var mainContent: some View {
        HStack {
            searchButton
            Spacer()
            filterButton
        }
        .padding()
        .background(backgroundView)
    }

    private var searchButton: some View {
        Button(action: {}) {
            Label("Search your posts", systemImage: CUPSystemIcon.magnifyingglass)
        }
    }

    private var filterButton: some View {
        Button(action: {}) {
            Image(systemName: CUPSystemIcon.filter)
        }
    }
}

#Preview {
    ProfileToolbar()
        .padding()
}
