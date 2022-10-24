//
//  ListRowView.swift
//  MarkBook
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct ListRowView: View {
    
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}
