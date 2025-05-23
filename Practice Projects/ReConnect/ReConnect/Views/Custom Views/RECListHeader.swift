//
//  RECListHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RECListHeader: View {
    var icon: String?
    var renderingMode: SymbolRenderingMode?
    var title: String
    var description: String?
    var isSuperHeader: Bool

    private let vSpacing: CGFloat = 10
    private let iconSizeSuperHeader: CGFloat = 100
    private let iconSizeNormalHeader: CGFloat = 80

    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: vSpacing) {
                iconSection
                titleDescriptionSection
            }
            Spacer()
        }
    }

    private var iconSection: some View {
        Image(systemName: icon ?? CUPSystemIcon.settings)
            .foregroundColor(.accentColor)
            .accessibilityIdentifier("genericListHeaderIcon")
            .symbolRenderingMode(renderingMode ?? .monochrome)
            .if(isSuperHeader) {
                $0.font(.system(size: iconSizeSuperHeader))
            }
            .if(!isSuperHeader) {
                $0.font(.system(size: iconSizeNormalHeader))
            }
    }

    private var titleDescriptionSection: some View {
        VStack(spacing: vSpacing) {
            Text(title)
                .font(isSuperHeader ? .title : .title3)
                .fontWeight(.bold)
                .accessibilityIdentifier("genericListHeaderTitle")

            if let description = self.description, !description.isEmpty {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .multilineTextAlignment(.center)
    }
}

struct RECHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECListHeader(
            icon: "message.fill",
            title: "Welcome to Re:Connect",
            isSuperHeader: true
        )

        RECListHeader(
            icon: CUPSystemIcon.profile,
            renderingMode: .hierarchical,
            title: "Re:Connect Account",
            description: "Get an overview look of your account, disable or delete your account, or switch to a different Re:Connect Account.",
            isSuperHeader: false
        )
    }
}
