//
//  RECDisplayLabel.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct RECDisplayLabel: View {
    
    enum LabelDisplayMode {
        case leading
        case trailing
    }
    
    var displayMode: LabelDisplayMode
    var label: String
    var value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(label)
            
            if displayMode == .leading {
                Text(value)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            } else {
                Spacer()
                
                Text(value)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

struct RECDisplayLabel_Previews: PreviewProvider {
    static var previews: some View {
        RECDisplayLabel(displayMode: .trailing, label: "Label", value: "Value")
    }
}
