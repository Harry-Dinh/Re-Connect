//
//  PostModel.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import Foundation

struct PostModel: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var body: String
    var date: String
    var liked: Bool
}
