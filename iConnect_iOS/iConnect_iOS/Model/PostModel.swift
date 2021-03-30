//
//  PostModel.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import Foundation

struct PostModel {
    
    static let shared = PostModel()
    
    var body: String = ""
    var date: String = ""
    var title: String? = ""
    var uuid: String = ""
}
