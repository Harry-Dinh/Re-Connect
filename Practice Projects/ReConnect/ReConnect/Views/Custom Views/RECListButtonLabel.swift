//
//  RECListButtonLabel.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-12.
//

import SwiftUI

struct RECListButtonLabel: View {
    
    enum ButtonStyle {
        /// Make the label of the button stands out
        case labelProminant
        /// Make the background of the button stands out
        case backgroundProminant
        /// Give the button label a red tint (indicating dangerous actions)
        case destructive
    }
    
    var title: String
    var style: RECListButtonLabel.ButtonStyle
    
    var body: some View {
        if style == .backgroundProminant {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()
            }
        } else if style == .labelProminant {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        } else {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Spacer()
            }
        }
    }
}

struct RECListButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        RECListButtonLabel(title: "Label", style: .labelProminant)
    }
}
