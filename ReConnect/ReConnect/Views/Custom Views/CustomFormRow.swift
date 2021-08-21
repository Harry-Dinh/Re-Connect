//
//  CustomFormRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-21.
//

import SwiftUI

struct CustomFormRow: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: icon)
                .imageScale(.large)
        }
        .padding(.vertical, 10)
    }
}

struct CustomFormRowPreview: PreviewProvider {
    static var previews: some View {
        CustomFormRow(title: "New Folder", icon: "folder.badge.plus")
    }
}
