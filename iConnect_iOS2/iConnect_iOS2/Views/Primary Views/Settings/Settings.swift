//
//  Settings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox {
                    NavigationLink(destination: AccountSettings()) {
                        CustomTableRow(icon: "person.crop.circle.fill", title: "My Account", backgroundColor: .accentColor)
                    }
                }
                .cornerRadius(20)
                
                // MARK: General Box
                GroupBox(label: Text("General").foregroundColor(.secondary)) {
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "paintbrush.fill", title: "App Appearance", backgroundColor: .purple)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "house.fill", title: "Home Settings", backgroundColor: .yellow)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "play.rectangle.fill", title: "Media", backgroundColor: .blue)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "app.badge.fill", title: "Notifications", backgroundColor: .red)
                    }
                    
                    NavigationLink(destination: PrivacyAndSecurity()) {
                        CustomTableRow(icon: "hand.raised.fill", title: "Privacy & Security", backgroundColor: .red)
                    }
                }
                .cornerRadius(20)
                
                GroupBox {
                    NavigationLink(destination: AboutSettings()) {
                        CustomTableRow(icon: "info.circle.fill", title: "About iConnect", backgroundColor: .gray)
                    }
                }
                .cornerRadius(20)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left.circle")
                    .imageScale(.large)
            })
            
            Text("Settings").font(.title3).bold()
        })
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Settings()
        }
    }
}
