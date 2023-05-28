//
//  RECProfileInfoSheet.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI

struct RECProfileInfoSheet: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    @State private var showInfoSheetInfo = false
    
    var body: some View {
        GroupBox {
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Label(loginVM.loggedInUser?.emailAddress ?? RECUser.placeholderUser.emailAddress,
                          systemImage: CUPSystemIcon.emailEnvelope)
                    Label("\(loginVM.loggedInUser?.age ?? RECUser.placeholderUser.age) years old",
                          systemImage: CUPSystemIcon.gift)
                }
                Spacer()
            }
            .padding(7)
        } label: {
            HStack {
                Text("other info".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                
                Button(action: {
                    showInfoSheetInfo.toggle()
                }) {
                    Image(systemName: CUPSystemIcon.infoCircle)
                }
            }
        }
        .cornerRadius(15)
        .alert(Text("The information in this box will not be shown to the public, even with a public account."),
               isPresented: $showInfoSheetInfo) {
            Button("Done", role: .cancel, action: {})
        }
    }
}

struct RECProfileInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileInfoSheet()
    }
}
