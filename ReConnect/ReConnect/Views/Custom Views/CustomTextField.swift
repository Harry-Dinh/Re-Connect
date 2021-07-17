//
//  CustomTextField.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var icon: String
    @Binding var text: String
    
    var body: some View {
        Label(
            title: { TextField(placeholder, text: $text) },
            icon: { Image(systemName: icon).foregroundColor(.secondary) })
            .padding()
            .background(
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(Color(.systemGray6))
            )
    }
}

struct CustomSecureField: View {
    
    var placeholder: String
    var icon: String
    @Binding var text: String
    
    var body: some View {
        Label(
            title: { SecureField(placeholder, text: $text) },
            icon: { Image(systemName: icon).foregroundColor(.secondary) })
            .padding()
            .background(
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(Color(.systemGray6))
            )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "Email address", icon: "envelope", text: .constant(""))
    }
}
