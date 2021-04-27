//
//  ProfileScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-22.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var userProfile = ProfileVM.shared
    var userDefaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 70, height: 70)
//            Text("\(userDefaults.string(forKey: "first_name")!) \(userDefaults.string(forKey: "last_name")!)")
//                .font(.title)
//            
//            Text("\(userDefaults.string(forKey: "email")!)")
//                .foregroundColor(.secondary)
//                .font(.subheadline)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
