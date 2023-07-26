//
//  RECServer.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation

struct RECServer: Identifiable {
    var id: String
    var name: String
    var iconURL: String?
    var channels: [RECTextChannel]
}
