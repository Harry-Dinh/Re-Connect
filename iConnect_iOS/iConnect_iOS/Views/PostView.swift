//
//  PostView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-10.
//

import SwiftUI

struct PostView: View {
    
    //    let postData: [PostExampleData] = Bundle.main.decode("PostExample")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color.gray)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading) {
                        Text("Jeni Takanashi")
                            .font(.headline)
                        Text("Mar 10, 2021 at 10:24".uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        Section {
                            Button(action: {}) {
                                HStack {
                                    Text("Save")
                                    Image(systemName: "bookmark")
                                }
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Text("Share to Story")
                                    Image(systemName: "plus.rectangle.portrait")
                                }
                            }
                        }
                        
                        Section {
                            Button(action: {}) {
                                Text("Unfollow")
                                Image(systemName: "person.fill.xmark")
                            }
                        }
                        
                        Section {
                            Button(action: {}) {
                                HStack {
                                    Text("Delete from Home")
                                        .foregroundColor(.red)
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Text("Report to iConnect")
                                        .foregroundColor(.red)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    })
                }
                .padding()
                
                Divider()
                
                ICCVEmptyView(width: nil, height: 10, color: .clear)
                
                HStack {
                    Image("testingAsset")
                        .resizable()
                        .scaledToFit()
                }
                
                ICCVEmptyView(width: nil, height: 10, color: .clear)
                
                Text("A trip to Tokyo")
                    .fontWeight(.heavy)
                    .font(.title2)
                    .padding(.horizontal)
                
                ICCVEmptyView(width: nil, height: 10, color: .clear)
                
                Text("Tokyo is the city of tradition mixed with the advanced modern technology. If you're a fan of anime or manga, you'll find Tokyo have almost everything you expected from the show you love (except there are no coloured hair schoolgirls).")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                ICCVEmptyView(width: nil, height: 15, color: .clear)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
