//
//  DRNumberView.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-22.
//

import SwiftUI

struct DRNumberView: View {
    
    @Binding var number: Int
    
    var body: some View {
        Text("\(number)")
            .padding()
            .font(.system(.largeTitle, design: .monospaced, weight: .bold))
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(.tertiaryLabelColor))
                    .frame(width: 90, height: 90)
            )
    }
}

struct DRNumberView_Previews: PreviewProvider {
    static var previews: some View {
        DRNumberView(number: .constant(0))
            .frame(width: 200, height: 200)
            .padding()
    }
}
