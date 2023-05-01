//
//  CreateStudentAccView.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-20.
//

import SwiftUI

struct CreateStudentAccView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.system(size: 90))
                        .foregroundColor(.green)
                    
                    Text("New Student Account")
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
                    
                    GroupBox("Student Email and Password") {
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

struct CreateStudentAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStudentAccView()
            .padding()
    }
}
