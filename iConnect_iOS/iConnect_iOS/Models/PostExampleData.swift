//
//  PostExampleData.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-10.
//

import Foundation

struct PostExampleData: Codable, Identifiable {
    var id: Int
    var owner: String
    var date_posted: String
    
    var post_title: String
    var post_message: String
}
