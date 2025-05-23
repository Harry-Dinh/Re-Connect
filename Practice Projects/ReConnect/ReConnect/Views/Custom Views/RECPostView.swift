//
//  RECPostView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-09-04.
//

import SwiftUI
import SDWebImageSwiftUI

struct RECPostView: View {
    // MARK: - View Models
    @ObservedObject var post: RECPostWrapper

    // MARK: - Local Constants
    private let pfpFrame: CGFloat = 40
    private let textPostLineLimit: Int = 5
    private let topPostPadding: CGFloat = 5

    // MARK: - View Components
    var body: some View {
        VStack {
            postHeaderView

            switch post.post.type {
            case .text:
                postTextView
            case .media:
                Text("Media post")
            default:
                Text("Unknown or corrupted post data")
            }

            actionButtons
            Divider()
        }
    }

    var postHeaderInfoView: some View {
        HStack {
            Group {
                if let pfpURL = post.post.originalPoster.pfpURL, pfpURL != "" {
                    AsyncImage(url: URL(string: pfpURL)) { phase in
                        switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .frame(width: pfpFrame, height: pfpFrame)
                                    .clipShape(Circle())
                                    .onAppear {
                                        print("PFP URL: \(pfpURL)")
                                    }
                            case .failure:
                                Image(systemName: CUPSystemIcon.profile)
                                    .font(.title)
                            @unknown default:
                                EmptyView()
                        }
                    }
                } else {
                    Image(systemName: CUPSystemIcon.profile)
                        .font(.title)
                }

                VStack(alignment: .leading) {
                    Text(post.post.originalPoster.displayName)
                        .font(.headline)
                    Text(post.post.datePosted.localizedStringValue())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    var postHeaderActionView: some View {
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

    var postHeaderView: some View {
        HStack {
            postHeaderInfoView
            Spacer()
            postHeaderActionView
        }
        .padding(.top, topPostPadding)
    }

    var postTextView: some View {
        HStack {
            if let content = post.post.content as? String {
                Text(content)
                    .textSelection(.enabled)
                    .multilineTextAlignment(.leading)
                    .lineLimit(textPostLineLimit)
            } else {
                Text("Text post")
                    .textSelection(.enabled)
                    .multilineTextAlignment(.leading)
                    .lineLimit(textPostLineLimit)
            }
            Spacer()
        }
    }

    var actionButtons: some View {
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

#Preview {
    RECPostView(post: RECPostWrapper(RECPost.placeholder))
        .padding()
}
