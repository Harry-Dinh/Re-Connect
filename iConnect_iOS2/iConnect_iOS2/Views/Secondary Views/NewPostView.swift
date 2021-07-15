//
//  NewPostView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-07-14.
//

import SwiftUI

struct NewPostView: View {
    
    @ObservedObject var viewModel = NewPostVM.shared
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                GroupBox {
                    TextField("Title (optional)", text: $viewModel.postTitleField)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .lineLimit(0)
                }
                .padding()
                
                CustomTFAccessoryInputView(hint: "Aa", text: $viewModel.postBodyField, containerHeight: $viewModel.containerHeight)
                    .frame(height: viewModel.containerHeight)
                    .padding(.horizontal, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Create New Post")
                    .font(.title3)
                    .bold()
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                })
                Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button(action: {
                    viewModel.writeTextPostToDatabase(title: viewModel.postTitleField, body: viewModel.postBodyField, datePosted: Date())
                }, label: {
                    Image(systemName: "arrow.up")
                })
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPostView()
        }
    }
}
