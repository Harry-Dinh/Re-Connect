//
//  AcademicsView.swift
//  CU Mobile
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct AcademicsView: View {
    var body: some View {
        NavigationView {
            List {
                Label("cuLearn", systemImage: "iphone")
                Label("Classes", systemImage: "rectangle.inset.filled.and.person.filled")
                Label("Weekly Schedule", systemImage: "calendar")
                Label("Exams", systemImage: "pencil")
                Label("Grades", systemImage: "checkmark.square")
                Label("Library", systemImage: "book")
                Label("Room Booking", systemImage: "building.2.crop.circle")
            }
            .navigationTitle("Academics")
        }
    }
}

struct AcademicsView_Previews: PreviewProvider {
    static var previews: some View {
        AcademicsView()
    }
}
