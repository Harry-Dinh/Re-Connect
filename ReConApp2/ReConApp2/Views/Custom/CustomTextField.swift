//
//  CustomTextField.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-15.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    var placeholder: String
    var isSecureTextEntry: Bool
    
    var body: some View {
        if !isSecureTextEntry {
            TextField(placeholder, text: $text)
                .padding()
                .frame(maxWidth: 350)
                .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 10))
        }
        else {
            SecureField(placeholder, text: $text)
                .padding()
                .frame(maxWidth: 350)
                .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Email address", isSecureTextEntry: false)
            .padding()
    }
}
