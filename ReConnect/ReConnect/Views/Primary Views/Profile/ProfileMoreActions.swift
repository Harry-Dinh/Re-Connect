//
//  ProfileMoreActions.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-21.
//

import SwiftUI

struct ProfileMoreActions: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: FollowersList()) {
                    CustomFormRow(title: "Followers", icon: "person.2")
                }
            }
            .navigationTitle("More Actions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {presentationMode.wrappedValue.dismiss()}
                }
            })
        }
    }
}

struct ProfileMoreActions_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMoreActions()
    }
}
