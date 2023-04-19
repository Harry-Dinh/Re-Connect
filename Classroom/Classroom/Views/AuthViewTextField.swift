//
//  AuthViewTextField.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-19.
//

import SwiftUI

struct AuthViewTextField: View {
    
    @Binding var text: String
    var placeholder: String
    var isPrivateField: Bool
    
    var body: some View {
        HStack {
            Text(placeholder)
            
            if (!isPrivateField) {
                TextField(placeholder, text: $text)
            } else {
                SecureField(placeholder, text: $text)
            }
        }
    }
}

struct AuthViewTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewTextField(text: .constant(""), placeholder: "Placeholder", isPrivateField: false)
            .padding()
    }
}
