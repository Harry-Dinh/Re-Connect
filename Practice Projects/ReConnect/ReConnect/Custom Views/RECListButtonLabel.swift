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
        } else {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
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
