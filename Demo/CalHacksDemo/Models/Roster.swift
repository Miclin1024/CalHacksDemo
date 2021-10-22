//
//  Roster.swift
//  CalHacksDemo
//
//  Created by Michael Lin on 10/22/21.
//  Copyright © 2021 Michael Lin. All rights reserved.
//

import Foundation

class Roster {
    
    static let main = Roster()
    
    // Top 6 Baby Names According to SSA
    let names = ["Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava"]
    
    private(set) var remainingNames = [String]()
    
    private(set) var namesPresent = [String]()
    
    private(set) var namesAbsent = [String]()
    
    init() { reset() }
    
    func reset() {
        remainingNames = names.shuffled()
        namesPresent = []
        namesAbsent = []
    }
    
    func getNextName() -> String? {
        return remainingNames.popLast()
    }
    
    func addName(toPresent name: String) {
        namesPresent.append(name)
    }
    
    func addName(toAbsent name: String) {
        namesAbsent.append(name)
    }
    
    func hasNamesLeft() -> Bool {
        return remainingNames.count != 0
    }
}
