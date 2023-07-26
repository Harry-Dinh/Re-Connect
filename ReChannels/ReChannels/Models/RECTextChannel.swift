//
//  RECTextChannel.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation

struct RECTextChannel: Identifiable {
    var id: String
    var name: String
    var messages: [RECMessage]
}
