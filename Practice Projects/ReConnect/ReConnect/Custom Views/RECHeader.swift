//
//  RECHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RECHeader: View {
    
    var icon: String?
    var label: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon ?? "gear")
                .font(.system(size: 100))
                .foregroundColor(.accentColor)
            
            Text(label)
                .font(.largeTitle)
                .bold()
        }
        .padding()
    }
}

struct RECHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECHeader(icon: "message.fill", label: "Re:Connect")
    }
}
