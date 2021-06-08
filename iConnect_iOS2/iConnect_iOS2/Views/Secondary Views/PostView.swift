//
//  PostView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-10.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var postVM = PostVM.shared
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
