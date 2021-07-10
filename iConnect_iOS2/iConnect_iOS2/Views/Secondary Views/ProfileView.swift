//
//  ProfileView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-25.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileVM.shared
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.unwrapUsernameFromStorage())
                        .font(.title)
                        .bold()
                    Text("@Username")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            CustomEmptyView(width: nil, height: 1, foregroundColor: .clear)
            
            GroupBox(label: Label("Basic Information", systemImage: "info.circle").foregroundColor(.blue), content: {
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Label("Birthday: Dec 18, 2004", systemImage: "gift.fill")
                        Spacer()
                    }
                    
                    Label("Gender: Male", systemImage: "person.fill")
                }
            })
            
            CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
            
            GroupBox(label: Label("Public Information", systemImage: "globe").foregroundColor(.green), content: {
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Label("iConnect user since: July 2021", systemImage: "clock.fill")
                        Spacer()
                    }
                    
                    Label("Living in: Toronto, Ontario", systemImage: "mappin")
                    
                    Label("Education: Bloor Collegiate Institute", systemImage: "graduationcap.fill")
                }
            })
            
            CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
            
            Picker(selection: $viewModel.selectedTab, label: Text(""), content: {
                Text("Posts").tag(0)
                Text("Photos & Videos").tag(1)
                Text("Deleted").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            Divider()
            
            CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
            
            ForEach(1..<10, id: \.self) { _ in
                PostView()
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
            }
        }
        .padding([.top, .leading, .trailing])
        .navigationTitle(viewModel.unwrapUsernameFromStorage())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Edit") {}
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}
