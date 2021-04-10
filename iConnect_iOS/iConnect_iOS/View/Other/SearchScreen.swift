//
//  SearchScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-10.
//

import SwiftUI

struct SearchScreen: View {
    
    @ObservedObject var viewModel = SearchVM.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("search")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(.green)
                
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                TextField("Search", text: $viewModel.searchFieldText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if viewModel.isEditing && !viewModel.searchFieldText.isEmpty {
                                Button(action: {
                                    viewModel.searchFieldText = ""
                                }, label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                })
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        viewModel.isEditing = true
                    }
                
                if viewModel.isEditing {
                    Button("Cancel") {
                        viewModel.isEditing = false
                        viewModel.searchFieldText = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
