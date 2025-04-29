//
//  PostCreationView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-27.
//

import SwiftUI

struct PostCreationView: View {

    @ObservedObject private var viewModel = PostCreationVM.instance
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                RECTextEditorPlaceholderView(textToDetect: $viewModel.postContent, placeholderText: "Type something...")

                TextEditor(text: $viewModel.postContent)
                    .scrollContentBackground(.hidden)
                    .padding(.top, 5)
                    .padding(.horizontal, 9.5)
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Top toobar items
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss.callAsFunction() }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Text("Post")
                            .fontWeight(.semibold)
                    }
                    .disabled(viewModel.postContent.isEmpty)
                }

                // MARK: Bottom toolbar items
                ToolbarItemGroup(placement: .bottomBar) {
                    // TODO: Might want to split the toolbar content into a separate view to control the visibility of the keyboard dismiss button easier... But first, REFRESH ON THE FOCUSSTATE FUNCTIONALITY before implementing this!
                    Button(action: {}) {
                        Image(systemName: "photo.on.rectangle.angled")
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "textformat")
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "person.2.badge.plus")
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
}

struct PostCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PostCreationView()
    }
}
