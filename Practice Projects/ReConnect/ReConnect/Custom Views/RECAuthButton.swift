//
//  RECAuthButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RECAuthButton: View {
    
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .frame(minWidth: 150)
                .padding()
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
    }
}

struct RECAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        RECAuthButton(label: "Label") {}
    }
}
