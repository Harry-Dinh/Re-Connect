//
//  ProfileScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-22.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var userProfile = ProfileVM.shared
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 70, height: 70)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
