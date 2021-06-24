//
//  Settings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    GroupBox {
                        NavigationLink(destination: AccountSettings()) {
                            CustomTableRow(icon: "person.crop.circle.fill", title: "My Account", backgroundColor: .accentColor)
                        }
                    }
                    .cornerRadius(25)
                }
                .padding()
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
