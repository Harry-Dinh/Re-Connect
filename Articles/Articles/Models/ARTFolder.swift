//
//  ARTFolder.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import Foundation

struct ARTFolder: Identifiable {
    var id: String
    var name: String
    var urls: [String]
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled Folder"
        self.urls = []
    }
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.urls = []
    }
    
    init(name: String, urls: [String]) {
        self.id = UUID().uuidString
        self.name = name
        self.urls = urls
    }
    
    init(id: String, name: String, urls: [String]) {
        self.id = id
        self.name = name
        self.urls = urls
    }
    
    public static let placeholder = ARTFolder(id: "1234567890", name: "My Folder", urls: [])
}
