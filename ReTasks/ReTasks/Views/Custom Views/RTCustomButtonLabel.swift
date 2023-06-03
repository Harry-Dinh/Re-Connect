//
//  RTCustomButtonLabel.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-03.
//

import SwiftUI

struct RTCustomButtonLabel: View {
    
    enum LabelDisplayMode {
        case labelProminant
        case backgroundProminant
        case regularLabel
    }
    
    var label: String
    var displayMode: LabelDisplayMode?
    
    var body: some View {
        if displayMode == .labelProminant || displayMode == nil {
            HStack {
                Spacer()
                Text(label)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        } else if displayMode == .backgroundProminant {
            ZStack {
                Color.accentColor.opacity(0.25)
                
                HStack {
                    Spacer()
                    Text(label)
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                    Spacer()
                }
            }
        } else {
            HStack {
                Spacer()
                Text(label)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        }
    }
}

struct RTCustomButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        RTCustomButtonLabel(label: "Label", displayMode: .backgroundProminant)
    }
}
