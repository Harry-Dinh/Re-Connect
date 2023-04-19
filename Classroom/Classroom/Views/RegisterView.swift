//
//  RegisterView.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-19.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var authVM = AuthVM.shared
    
    var body: some View {
        NavigationSplitView {
            List {
                Label("Student Account", systemImage: "person")
                Label("Teacher Account", systemImage: "person.crop.circle")
                
                Section {
                    Label("Register Your Organization", systemImage: "building.2.crop.circle")
                }
            }
            .frame(width: 220)
            .frame(maxWidth: 220)
            .toolbar {
                ToolbarItem(placement: .destructiveAction) {
                    Button(action: {
                        authVM.showRegisterView = false
                    }) {
                        Text("Back to Login")
                    }
                }
            }
        } detail: {
            EmptyView()
        }
        .frame(width: 600, height: 600)
        .navigationSplitViewStyle(.prominentDetail)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
