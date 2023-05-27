//
//  RECProfileInfoSheet.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI

struct RECProfileInfoSheet: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        GroupBox {
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Label(loginVM.loggedInUser?.emailAddress ?? RECUser.placeholderUser.emailAddress, systemImage: "envelope")
                    Label("\(loginVM.loggedInUser?.age ?? RECUser.placeholderUser.age) years old",
                          systemImage: "gift")
                }
                Spacer()
            }
            .padding(7)
        } label: {
            Text("other info".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .cornerRadius(15)
    }
}

struct RECProfileInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileInfoSheet()
    }
}
