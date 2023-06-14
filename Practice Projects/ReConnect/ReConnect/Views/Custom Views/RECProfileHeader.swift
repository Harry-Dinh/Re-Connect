//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct RECProfileHeader: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    
    var body: some View {
        HStack {
            if loginVM.loggedInUser?.pfpURL == nil || loginVM.loggedInUser?.pfpURL == "" {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .symbolVariant(.fill)
                    .frame(width: 80, height: 80)
                    .overlay(
                        Circle()
                            .stroke(Color.secondary, lineWidth: 3)
                    )
            } else {
                WebImage(url: URL(string: (loginVM.loggedInUser?.pfpURL)!))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.secondary, lineWidth: 3)
                    )
            }
            
            RECProfileBackground()
        }
        .padding()
    }
}

struct RECProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader()
    }
}
