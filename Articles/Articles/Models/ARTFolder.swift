//
//  ARTFolder.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import Foundation
import LinkPresentation

struct ARTFolder: Identifiable {
    var id: String
    var name: String
    var articles: [LPLinkMetadata]
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled Folder"
        self.articles = []
    }
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.articles = []
    }
    
    init(name: String, articles: [LPLinkMetadata]) {
        self.id = UUID().uuidString
        self.name = name
        self.articles = articles
    }
    
    init(id: String, name: String, articles: [LPLinkMetadata]) {
        self.id = id
        self.name = name
        self.articles = articles
    }
    
    public static let placeholder = ARTFolder(id: "0000000000",
                                              name: "School Work",
                                              articles: [])
}
