//
//  Home.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var newPostVM = NewPostVM.shared
    @ObservedObject var viewModel = HomeVM.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1..<10) { _ in
                    PostView()
                        .padding()
                }
            }
            .navigationTitle("iConnect")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {}, label: {
                            Label("My Profile", systemImage: "person.crop.circle")
                        })
                        
                        Button(action: {
                            viewModel.showViewSettings.toggle()
                        }, label: {
                            Label("Home Settings", systemImage: "gear")
                        })
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    }
                    .sheet(isPresented: $viewModel.showViewSettings, content: {
                        HomeViewSettings()
                    })

                    
                    Button(action: {
                        newPostVM.showNewPost.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                    .sheet(isPresented: $newPostVM.showNewPost, content: {
                        NewPostScreen()
                    })
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
