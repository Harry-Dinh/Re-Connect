//
//  UserModel.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-21.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var fullName: String = ""
    var username: String = ""
    var isPrivateAccount: Bool = false
    var uid: String = ""
}
