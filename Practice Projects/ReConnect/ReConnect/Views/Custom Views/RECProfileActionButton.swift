//
//  RECProfileActionButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-19.
//

import SwiftUI

struct RECProfileActionButton: View {
    
    var label: String
    var icon: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                Text(label)
                    .font(.footnote)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary)
        )
    }
}

struct RECProfileActionButton_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileActionButton(label: "Follow Request", icon: CUPSystemIcon.userRequestAction) {}
    }
}
