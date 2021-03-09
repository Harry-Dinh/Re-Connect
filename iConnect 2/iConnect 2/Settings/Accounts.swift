//
//  Accounts.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct Accounts: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        ZStack {
            CustomEmptyView(width: 500, height: 300, color: Color.gray.opacity(0.06))
            
            Button("Sign Out") {
                withAnimation {
                    isSignedIn = false
                }
            }
        }
    }
}

struct Accounts_Previews: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}
