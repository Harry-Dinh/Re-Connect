//
//  SettingsScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SettingsHeader()) {
                    Button("Sign Out") {
                        LoginVM.shared.signOutUser()
                        isSignedIn = false
                    }
                    
                    Button("Print device name") {
                        print(UIDevice.current.machineName())
                    }
                }
                
                Section {
                    
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsHeader: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Text("Harry Dinh")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
