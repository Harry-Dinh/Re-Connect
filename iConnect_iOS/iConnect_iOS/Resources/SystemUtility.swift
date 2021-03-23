//
//  SystemUtility.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-22.
//

import Foundation

class SystemUtility {
    
    static let shared = SystemUtility()
    
    public func generateRandomNumber(_ from: Int, _ to: Int, _ quantity: Int?) -> [Int] {
        var randomNumbers = [Int]() // All of our generated numbers
        var numberOfNumbers = quantity // How many numbers to generate
        
        let lowest = UInt32(from)
        let highest = UInt32(to + 1)
        
        if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1 {
            numberOfNumbers = (to - from) + 1
        }
        
        while randomNumbers.count != numberOfNumbers {
            let myNumber = arc4random_uniform(highest - lowest) + lowest
            
            if !randomNumbers.contains(Int(myNumber)) {
                randomNumbers.append(Int(myNumber))
            }
        }
        
        return randomNumbers
    }
}
