//
//  RECDisplayLabel.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct RECDisplayLabel: View {
    
    enum ValueDisplayMode {
        case small
        case standard
    }
    
    var valueDisplayMode: ValueDisplayMode?
    var label: String
    var value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(label)
            
            Spacer()
            
            if valueDisplayMode == nil || valueDisplayMode == .standard {
                Text(value)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            } else {
                Text(value)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
                    .font(.footnote)
            }
        }
    }
}

struct RECDisplayLabel_Previews: PreviewProvider {
    static var previews: some View {
        RECDisplayLabel(label: "Label", value: "Value")
    }
}
