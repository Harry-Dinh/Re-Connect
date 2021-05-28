//
//  Settings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("settings")
                    .font(Font.custom("Oxanium", size: 30))
                    .foregroundColor(Color("iconnectBlue"))
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 7)
            
            Divider()
            
            List {
                Button(action: {
                    LoginVM.shared.signOutUser()
                }, label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                })
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
