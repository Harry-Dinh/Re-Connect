//
//  DeveloperSettings.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-26.
//

import SwiftUI

struct DeveloperSettings: View {
    var body: some View {
        Form {
            Button(action: {
//                DiscoverVM.shared.filterCurrentUser()
            }, label: {
                Text("Filter Current User - DiscoverVM()")
            })
        }
        .navigationTitle("Developer")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DeveloperSettings_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSettings()
    }
}
