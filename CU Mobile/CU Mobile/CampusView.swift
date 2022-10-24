//
//  CampusView.swift
//  CU Mobile
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct CampusView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Label("Map", systemImage: "map")
                    Label("Dining Services", systemImage: "fork.knife")
                    Label("Campus Card", systemImage: "creditcard")
                    Label("Mental Health and Well-Being", systemImage: "heart")
                }
                Label("Support Services", systemImage: "info.circle")
                Label("Pathways to Graduation", systemImage: "graduationcap")
                Label("Your Degree, Your Future", systemImage: "person")
                Label("Carleton Athletics", systemImage: "sportscourt")
                Label("Housing and Residence Life", systemImage: "building")
                Label("Transit", systemImage: "bus")
                Label("Sustainability – Waste Wizard", systemImage: "leaf")
            }
            .navigationTitle("Campus")
        }
    }
}

struct CampusView_Previews: PreviewProvider {
    static var previews: some View {
        CampusView()
    }
}
