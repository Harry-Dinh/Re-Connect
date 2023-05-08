//
//  ContentView.swift
//  Manager
//
//  Created by Harry Dinh on 2023-05-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedField = 0
    @State private var currentDate = Date()
    @State private var rentFromDate = Date()
    @State private var rentToDate = Date()
    
    var body: some View {
        NavigationView {
            List {
                Picker(selection: $selectedField) {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                } label: {
                    Text("Field")
                }
                
                DatePicker(selection: $currentDate, displayedComponents: .date) {
                    Text("Date of rental")
                }
                
                DatePicker(selection: $rentFromDate, displayedComponents: .hourAndMinute) {
                    Text("Rent from")
                }
                
                DatePicker(selection: $rentToDate, displayedComponents: .hourAndMinute) {
                    Text("Rent to")
                }
            }
            .navigationBarTitle("Manager")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
