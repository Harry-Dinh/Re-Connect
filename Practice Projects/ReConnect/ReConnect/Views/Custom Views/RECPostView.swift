//
//  RECPostView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-09-04.
//

import SwiftUI

struct RECPostView: View {
    
    @ObservedObject var post: RECPostWrapper
    
    var body: some View {
        VStack {
            // Header view
            HStack {
                Group {
                    Image(systemName: CUPSystemIcon.profile)
                        .font(.title)
                    VStack(alignment: .leading) {
                        Text(post.post.originalPoster.displayName)
                            .font(.headline)
                        Text("Date posted...")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                Menu {
                    Button(action: {}) {
                        Label("Like", systemImage: CUPSystemIcon.heart)
                    }
                    
                    Button(action: {}) {
                        Label("Comment...", systemImage: CUPSystemIcon.commentBubble)
                    }
                    
                    Button(action: {}) {
                        Label("Share...", systemImage: CUPSystemIcon.share)
                    }
                    
                    Button(action: {}) {
                        Label("View Profile", systemImage: CUPSystemIcon.profile)
                    }
                    
                    Section {
                        Button(action: {}) {
                            Label("Hide Post", systemImage: CUPSystemIcon.visibilityStatus)
                                .symbolVariant(.slash)
                        }
                        
                        Button(role: .destructive, action: {}) {
                            Label("Report Post...", systemImage: CUPSystemIcon.reportAction)
                        }
                    }
                } label: {
                    Image(systemName: CUPSystemIcon.moreMenu)
                        .symbolVariant(.circle)
                }
            }
            
            // Post content view
            switch post.post.type {
            case .text:
                HStack {
                    Text("Text post")
                        .textSelection(.enabled)
                    Spacer()
                }
            case .media:
                Text("Media post")
            default:
                Text("Unknown or corrupted post data")
            }
            
            // Action buttons
            HStack {
                Toggle(isOn: .constant(false)) {
                    Label("Like", systemImage: CUPSystemIcon.heart)
                }
                .toggleStyle(.button)
                Spacer()
                Button(action: {}) {
                    Label("Comment", systemImage: CUPSystemIcon.commentBubble)
                }
                Spacer()
                Button(action: {}) {
                    Label("Share", systemImage: CUPSystemIcon.share)
                }
                .padding(.trailing)
            }
            .padding(.top)
            .fontWeight(.medium)
        }
    }
}

#Preview {
    RECPostView(post: RECPostWrapper(RECPost.placeholder))
        .padding()
}
