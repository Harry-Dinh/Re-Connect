//
//  RETUser.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-30.
//

import Foundation

class RETUser: ObservableObject {
    
    public static let user = RETUser()
    
    var displayName: String
    var firebaseUID: String
    var pfpURL: String?
    var dataPath: String?
    
    init() {
        self.displayName = "Generic User"
        self.firebaseUID = "00000000000"
        self.pfpURL = ""
        self.dataPath = ""
    }
    
    init(displayName: String, firebaseUID: String, pfpURL: String?) {
        self.displayName = displayName
        self.firebaseUID = firebaseUID
        self.pfpURL = pfpURL
        self.dataPath = ""
    }
    
    init(displayName: String, firebaseUID: String, pfpURL: String?, dataPath: String?) {
        self.displayName = displayName
        self.firebaseUID = firebaseUID
        self.pfpURL = pfpURL
        self.dataPath = dataPath
    }
    
    public func getName() -> String {
        return self.displayName
    }
    
    public func getUID() -> String {
        return self.firebaseUID
    }
    
    public func getPfpURL() -> String {
        guard let pfpURL = self.pfpURL else {
            return ""
        }
        return pfpURL
    }
    
    public func setName(_ displayName: String) {
        self.displayName = displayName
    }
    
    public func setUID(_ firebaseUID: String) {
        self.firebaseUID = firebaseUID
    }
    
    public func setPfpURL(_ pfpURL: String) {
        self.pfpURL = pfpURL
    }
    
    public static let placeholderUser = RETUser(displayName: "Generic User", firebaseUID: "000000000000", pfpURL: "")
}
