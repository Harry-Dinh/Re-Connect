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
                    .font(Font.custom("Oxanium", size: 36))
                    .foregroundColor(Color("iconnectBlue"))
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding()
            
            CustomEmptyView(width: nil, height: 1, foregroundColor: Color(.systemGray4))
            
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
