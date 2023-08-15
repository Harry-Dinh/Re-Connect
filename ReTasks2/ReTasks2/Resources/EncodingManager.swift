//
//  EncodingManager.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation

/// A manager that is responsible for encoding/decoding every `Codable` object in this app.
class EncodingManager: ObservableObject {
    /// The shared instance of `EncodingManager`.
    public static let shared = EncodingManager()
    
    /// The system's built-in JSON encoder.
    private let encoder = JSONEncoder()
    
    /// The system's built-in JSON decoder.
    private let decoder = JSONDecoder()
    
    enum UserDefaultsCode: String {
        case listsIDs = "listsIDs"
    }
    
    // MARK: - ENCODERS
    
    // MARK: RETList
    
    public func encode(_ list: RETList) {
        do {
            let listData = try encoder.encode(list)
            
            UserDefaults.standard.set(listData, forKey: list.id)
            print("Successfully encode list")
        } catch {
            print("Failed to encode RETList")
            // Show error alert action...
        }
    }
    
    public func bulkEncode(lists: [RETList]) {
        for list in lists {
            encode(list)
        }
    }
    
    public func writeListIDsToUserDefaults(with lists: [RETList]) {
        var ids: [String] = []
        
        for list in lists {
            ids.append(list.id)
        }
        
        UserDefaults.standard.set(ids, forKey: UserDefaultsCode.listsIDs.rawValue)
    }
    
    public func encode(_ item: RETItem) {
        do {
            let itemData = try encoder.encode(item)
            
            UserDefaults.standard.set(itemData, forKey: item.id)
            print("Successfully encode item")
        } catch {
            print("Failed to encode RETItem")
            // Show error alert action...
        }
    }
    
    public func bulkEncode(items: [RETItem]) {
        for item in items {
            encode(item)
        }
    }
    
    // MARK: - DECODERS
    
    public func readListsIDs() -> [String] {
        guard let ids = UserDefaults.standard.value(forKey: UserDefaultsCode.listsIDs.rawValue) as? [String] else {
            print("Failed to get lists ids")
            return []
        }
        return ids
    }
}
