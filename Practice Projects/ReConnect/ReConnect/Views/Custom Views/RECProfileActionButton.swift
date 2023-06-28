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
        GroupBox {
            Button(action: buttonAction) {
                VStack(spacing: 5) {
                    Image(systemName: icon)
                        .imageScale(.large)
                    Text(label)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(15)
    }
}

struct RECProfileActionButton_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileActionButton(label: "Follow Request", icon: CUPSystemIcon.userRequestAction) {}
    }
}
