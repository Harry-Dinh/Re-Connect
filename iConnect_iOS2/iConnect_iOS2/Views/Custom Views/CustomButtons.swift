//
//  CustomButtons.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-24.
//

import SwiftUI

struct SendButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
            
            Image(systemName: "arrow.up")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}

struct SendButtonPreview: PreviewProvider {
    static var previews: some View {
        SendButton()
    }
}
