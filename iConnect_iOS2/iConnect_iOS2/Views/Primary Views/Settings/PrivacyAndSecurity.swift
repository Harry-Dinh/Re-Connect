//
//  PrivacyAndSecurity.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-07-14.
//

import SwiftUI

struct PrivacyAndSecurity: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    GroupBox(label: Text("Posts and Stories Audiences").foregroundColor(.secondary)) {
                        
                        CustomTableRow(icon: "doc.richtext.fill", title: "Manage Post Audience", backgroundColor: .gray)
                        
                        CustomTableRow(icon: "rectangle.grid.2x2.fill", title: "Manage Story Audience", backgroundColor: .gray)
                    }
                    .cornerRadius(20)
                    
                    GroupBox(label: Text("App Security").foregroundColor(.secondary)) {
                        Toggle(isOn: .constant(false), label: {
                            CustomToggleLabel(icon: "faceid", title: "Use Touch ID / Face ID", backgroundColor: .gray)
                        })
                        
                        Toggle(isOn: .constant(false), label: {
                            CustomToggleLabel(icon: "nosign", title: "Block All Ads Activities", backgroundColor: .gray)
                        })
                        
                        CustomTableRow(icon: "clear.fill", title: "Clear Activity History After...", backgroundColor: .gray)
                    }
                    .cornerRadius(20)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left.circle")
                    .imageScale(.large)
            })
            
            Text("Privacy & Security")
                .font(.title3)
                .bold()
        })
    }
}

struct PrivacyAndSecurity_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PrivacyAndSecurity()
        }
    }
}
