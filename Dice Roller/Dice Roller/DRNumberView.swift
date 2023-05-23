//
//  DRNumberView.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct DRNumberView: View {
    
    @Binding var number: Int
    
    var body: some View {
        Text("\(number)")
            .font(.system(.largeTitle, design: .rounded, weight: .bold))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(.tertiaryLabel))
            )
    }
}

struct DRNumberView_Previews: PreviewProvider {
    static var previews: some View {
        DRNumberView(number: .constant(0))
    }
}
