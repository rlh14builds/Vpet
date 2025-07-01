//
//  EvolutionRule.swift
//  VPetGo
//
//  Created by Reese Hooks on 6/29/25.
//

import Foundation

struct EvolutionRule {
    let fromId: String
    let toId: String
    let stage: PetStage
    let conditions: [(Pet) -> Bool] // multiple conditions
    let requiredMatches: Int        // how many must pass
    let isFallback: Bool
    let statGains: [String: Int]
}
