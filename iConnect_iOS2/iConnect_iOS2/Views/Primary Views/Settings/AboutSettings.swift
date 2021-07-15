//
//  AboutSettings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-07-14.
//

import SwiftUI

struct AboutSettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    VStack(alignment: .leading) {
                        Text("iConnect")
                            .font(.title)
                            .bold()
                        
                        Text("By iConnect, Inc.")
                    }
                }
                
                GroupBox {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Version number")
                                .font(.headline)
                            Spacer()
                            Text("1.0")
                                .font(.system(size: 17, weight: .regular, design: .monospaced))
                        }
                        
                        HStack {
                            Text("Operating System")
                                .font(.headline)
                            Spacer()
                            Text("iOS / iPadOS")
                        }
                    }
                }
                .cornerRadius(20)
                
                GroupBox {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Project director")
                                .font(.headline)
                            Spacer()
                            Text("Harry Dinh")
                        }
                        
                        HStack {
                            Text("Chief designer")
                                .font(.headline)
                            Spacer()
                            Text("Kathy Nguyen")
                        }
                    }
                }
                .cornerRadius(20)
                
                HStack {
                    Text("Copyright ® 2021 iConnect, Inc. All rights reserved.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left.circle")
                    .imageScale(.large)
            })
            
            Text("My Account")
                .font(.title3)
                .bold()
        })
    }
}

struct AboutSettings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutSettings()
        }
    }
}
