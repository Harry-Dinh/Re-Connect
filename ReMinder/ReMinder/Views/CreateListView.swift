//
//  CreateListView.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import SwiftUI

struct CreateListView: View {
    
    /// The observed instance of `ListCreationController`
    @StateObject private var lcController = ListCreationController.shared

    // MARK: ENVIRONMENT PROPERTIES
    
    /// Dismiss current view as a presentation modal
    @Environment(\.dismiss) var dismissView
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Create New List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
