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
                NavigationLink(destination: CreateStudentAccView()) {
                    Label("Student Account", systemImage: "person")
                }
                
                NavigationLink(destination: CreateTeacherAccView()) {
                    Label("Teacher Account", systemImage: "person.crop.circle")
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
            Text("Please choose an account to create on the sidebar")
                .font(.title)
                .foregroundColor(.secondary)
        }
        .frame(width: 800, height: 600)
        .navigationSplitViewStyle(.prominentDetail)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
