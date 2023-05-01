//
//  CreateStudentAccView.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-20.
//

import SwiftUI

struct CreateTeacherAccView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.system(size: 90))
                        .foregroundColor(.accentColor)
                    
                    Text("New Teacher Account")
                        .font(.largeTitle)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    GroupBox("Personal Info") {
                        VStack(alignment: .leading, spacing: 10) {
                            AuthViewTextField(text: .constant(""), placeholder: "First Name", isPrivateField: false)
                            
                            AuthViewTextField(text: .constant(""), placeholder: "Last Name", isPrivateField: false)
                            
                            Text("This will be used as your display name in your classes.")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    }
                    
                    GroupBox("Teacher Email and Password") {
                        VStack(alignment: .leading, spacing: 10) {
                            AuthViewTextField(text: .constant(""), placeholder: "Email address", isPrivateField: false)
                            
                            AuthViewTextField(text: .constant(""), placeholder: "Password", isPrivateField: true)
                        }
                        .padding()
                    }
                }
                
                HStack(spacing: 10) {
                    Button("Clear") {}
                    
                    Button("Create Account") {}
                        .keyboardShortcut(.defaultAction)
                }
            }
            .padding()
        }
    }
}

struct CreateTeacherAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeacherAccView()
            .padding()
    }
}
