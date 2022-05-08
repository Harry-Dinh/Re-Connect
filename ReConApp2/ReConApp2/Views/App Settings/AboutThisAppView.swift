//
//  AboutThisAppView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-16.
//

import SwiftUI

struct AboutThisAppView: View {
    var body: some View {
        List {
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Re:Connect")
                        .font(.custom("Inter", size: 28, relativeTo: .title))
                        .fontWeight(.semibold)
                    
                    Text("From Re:Connect Inc.")
                        .font(.custom("Inter", size: 15, relativeTo: .subheadline))
                }
            }
            .listRowBackground(Color.clear)
            
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0 (beta)")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Build ID")
                    Spacer()
                    Text("22M81742")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
            
            Section {
                Button(action: {}) {
                    Text("Terms and Conditions")
                }
                
                Button(action: {}) {
                    Text("Privacy Policy")
                }
            }
            
            Section {
                Text("Copyright © 2022 Re:Connect Inc. All rights reserved.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.clear)
            }
        }
        .navigationTitle("About This App")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutThisAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutThisAppView()
        }
    }
}
