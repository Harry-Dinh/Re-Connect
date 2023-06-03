//
//  RTNoListAlert.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-03.
//

import SwiftUI

struct RTNoListAlert: View {
    var body: some View {
        HStack {
            Spacer()
            Label("You have no lists... yet.", systemImage: "circle.slash")
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct RTNoListAlert_Previews: PreviewProvider {
    static var previews: some View {
        RTNoListAlert()
    }
}
