//
//  NewListView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct NewListView: View {
    
    @ObservedObject private var homeVM = HomeVM.viewModel
    @ObservedObject private var viewModel = NewListVM.viewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(hex: viewModel.newList.color))
                            TextField("😀", text: $viewModel.listIcon)
                                .font(.system(size: 60, weight: .bold, design: .rounded))
                                .multilineTextAlignment(.center)
                                .keyboardType(.default)
                        }
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                    ColorPicker("List's Color", selection: $viewModel.listColorPicker, supportsOpacity: false)
                } footer: {
                    Text("Tap the big circle above to customize the list's icon using a single letter or emoji.")
                }
                
                Section {
                    HStack {
                        Spacer()
                        TextField("List name", text: $viewModel.newList.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical, 7)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
            .interactiveDismissDisabled()
            .navigationTitle("New List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss.callAsFunction()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.create(viewModel.newList)
                        viewModel.newList = RETList()
                        dismiss.callAsFunction()
                    }) {
                        Text("Create")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
