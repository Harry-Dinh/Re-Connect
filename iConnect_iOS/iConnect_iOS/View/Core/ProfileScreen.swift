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
            
            Text("\(unwrappedCachedName())")
                .font(.title)
                .fontWeight(.heavy)
        }
    }
    
    func unwrappedCachedName() -> String {
        guard let firstName = UserDefaults.standard.string(forKey: "user_first_name"),
              let lastName = UserDefaults.standard.string(forKey: "user_last_name") else {
            print("Cannot unwrap cached names")
            return "Unnamed User"
        }
        
        return "\(firstName) \(lastName)"
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
