//
//  RECEditProfilePFPHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct RECEditProfilePFPHeader: View {
    
    var pfpURL: String?
    
    var body: some View {
        HStack {
            Spacer()
            
            if pfpURL == nil || pfpURL == "" {
                Image(systemName: "\(CUPSystemIcon.profile).fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.secondary)
            } else {
                
            }
            
            Spacer()
        }
    }
}

struct RECEditProfilePFPHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECEditProfilePFPHeader()
    }
}
