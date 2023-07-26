//
//  RECMessage.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation

struct RECMessage: Identifiable {
    var id: String
    var sender: RECUser
    var content: String
    var dateSent: Date
    var isEdited: Bool
}
