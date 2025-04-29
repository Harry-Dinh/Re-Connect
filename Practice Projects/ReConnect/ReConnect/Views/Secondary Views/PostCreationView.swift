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
    @FocusState private var isKeyboardFocused: Bool?

    var body: some View {
        NavigationStack {
            ZStack {
                RECTextEditorPlaceholderView(textToDetect: $viewModel.postContent, placeholderText: "Type something...")

                TextEditor(text: $viewModel.postContent)
                    .scrollContentBackground(.hidden)
                    .padding(.top, 5)
                    .padding(.horizontal, 9.5)
                    .focused($isKeyboardFocused, equals: true)
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Top toobar items
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        if viewModel.postContent.isEmpty {
                            dismiss.callAsFunction()
                        } else {
                            viewModel.presentSaveDraftDialog.toggle()
                        }
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Text("Post")
                            .fontWeight(.semibold)
                    }
                    .disabled(viewModel.postContent.isEmpty)
                }

                // MARK: Bottom and keyboard toolbars
                ToolbarItemGroup(placement: .bottomBar) {
                    RECPostCreationToolbarView(showKeyboardDismissButton: false, isKeyboardFocused: $isKeyboardFocused)
                }

                ToolbarItemGroup(placement: .keyboard) {
                    RECPostCreationToolbarView(showKeyboardDismissButton: true, isKeyboardFocused: $isKeyboardFocused)
                }
            }
            .interactiveDismissDisabled()   // Prevent the new post view from being dismissed by swiping down on the sheet
            .confirmationDialog("Save Draft?", isPresented: $viewModel.presentSaveDraftDialog, titleVisibility: .hidden) {
                Button("Delete Draft", role: .destructive) {
                    viewModel.postContent = ""
                    dismiss.callAsFunction()
                }

                Button("Save Draft") {
                    // TODO: Add save action here...
                    dismiss.callAsFunction()
                }

                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

struct PostCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PostCreationView()
    }
}
