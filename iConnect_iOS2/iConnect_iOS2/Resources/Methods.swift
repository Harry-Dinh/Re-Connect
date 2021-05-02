//
//  Methods.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import Foundation

class Methods {
    static let shared = Methods()
    
    public func convertToSafeEmail(email: String) -> String {
        var safeEmail = ""
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
}
