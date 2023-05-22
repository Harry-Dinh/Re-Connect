//
//  ContentVM.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-22.
//

import Foundation

class ContentVM: ObservableObject {
    static let viewModel = ContentVM()
    
    @Published var dice1: Int = 0
    @Published var dice2: Int = 0
    
    public func rollDice() -> Int {
        let randInt = Int.random(in: 1...6)
        return randInt
    }
}
