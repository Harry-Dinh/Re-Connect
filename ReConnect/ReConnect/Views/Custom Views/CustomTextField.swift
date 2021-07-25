//
//  CustomTextField.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import SwiftUI

struct CustomTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    var placeholder: String
    var icon: String
    @Binding var text: String
    
    var body: some View {
        Label(
            title: { TextField(placeholder, text: $text) },
            icon: { Image(systemName: icon).foregroundColor(Color(.placeholderText)) })
            .padding()
            .background(
                Rectangle()
                    .cornerRadius(12)
                    .foregroundColor(colorScheme == .light ? Color(.systemGray6) : Color(.systemGray5))
            )
    }
}

struct CustomSecureField: View {
    
    @Environment(\.colorScheme) var colorScheme
    var placeholder: String
    var icon: String
    @Binding var text: String
    
    var body: some View {
        Label(
            title: { SecureField(placeholder, text: $text) },
            icon: { Image(systemName: icon).foregroundColor(Color(.placeholderText)) })
            .padding()
            .background(
                Rectangle()
                    .cornerRadius(12)
                    .foregroundColor(colorScheme == .light ? Color(.systemGray6) : Color(.systemGray5))
            )
    }
}

struct CustomSearchField: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.placeholderText))
                .padding(.trailing, 5)
            
            TextField(placeholder, text: $text)
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 10)
        .background(
            Rectangle()
                .foregroundColor(colorScheme == .light ? Color(.systemGray6) : Color(.systemGray5))
                .cornerRadius(12)
        )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    
    @State private var textMockUP = ""
    
    static var previews: some View {
        CustomTextField(placeholder: "Placeholder", icon: "envelope", text: .constant(""))
            .padding()
    }
}
