import Foundation

enum PetStage: Int, CaseIterable {
    case egg = 1
    case baby
    case intraining
    case rookie
    case champion
    case ultimate
    case mega
    case dead
}

class Pet: ObservableObject {
    // Care Stats
    @Published var hunger: Int = 0
    @Published var careMistakes: Int = 0
    @Published var happiness: Int = 0
    @Published var discipline: Int = 0
    @Published var weight1: Int = 5

    // Battle Stats
    @Published var hp: Int = 10
    @Published var mp: Int = 5
    @Published var speed: Int = 3
    @Published var defence: Int = 2
    @Published var attack: Int = 3
    @Published var knowledge: Int = 1
    @Published var victories: Int = 0
    

    // Lifecycle
    @Published var stageStartDate: Date
    @Published var stage: PetStage = .egg
    @Published var isAlive: Bool = true
    @Published var speciesId: String = "EggFire"
    @Published var evolutionHistory: [String] = ["EggFire"]

    var displayName: String {
        monsterDB[speciesId]?.displayName ?? speciesId
    }

    init() {
        self.stageStartDate = Date()
    }

    func reset() {
        speciesId = "EggFire"
        evolutionHistory = ["EggFire"]

        hunger = 0
        careMistakes = 0
        happiness = 100
        discipline = 0

        hp = 10
        mp = 5
        speed = 3
        defence = 2
        attack = 3
        knowledge = 1
        victories = 0
        weight1 = 5

        stage = .egg
        stageStartDate = Date()
        isAlive = true
    }

    func updateStage() {
        let elapsed = Date().timeIntervalSince(stageStartDate)

        if elapsed > 172800 && stage.rawValue < PetStage.dead.rawValue {
            tryEvolve(toStage: .baby)
            tryEvolve(toStage: .intraining)
            tryEvolve(toStage: .rookie)
            tryEvolve(toStage: .champion)
            tryEvolve(toStage: .ultimate)
            tryEvolve(toStage: .mega)
            stage = .dead
            speciesId = "GhostMon"
            evolutionHistory.append("GhostMon")
        } else if elapsed > 86400 && stage.rawValue < PetStage.champion.rawValue {
            tryEvolve(toStage: .baby)
            tryEvolve(toStage: .intraining)
            tryEvolve(toStage: .rookie)
            tryEvolve(toStage: .champion)
        } else if elapsed > 3600 && stage.rawValue < PetStage.rookie.rawValue {
            tryEvolve(toStage: .baby)
            tryEvolve(toStage: .intraining)
            tryEvolve(toStage: .rookie)
        } else if elapsed > 900 && stage.rawValue < PetStage.baby.rawValue {
            tryEvolve(toStage: .baby)
        }
    }

    @discardableResult
    func tryEvolve(toStage: PetStage) -> Bool {
        print("🟡 TRYING TO EVOLVE")
        print("→ speciesId: \(speciesId)")
        print("→ target stage: \(toStage)")

        let rules = evolutionRules.filter {
            $0.fromId == speciesId && $0.stage == toStage
        }

        print("→ found rules: \(rules.map { $0.toId })")

        let validMatches = rules.filter { rule in
            if rule.isFallback { return false }
            let passed = rule.conditions.filter { $0(self) }.count
            return passed >= rule.requiredMatches
        }

        let fallback = rules.first(where: { $0.isFallback })

        print("→ valid matches: \(validMatches.map { $0.toId })")
        if let fallback = fallback {
            print("→ fallback available: \(fallback.toId)")
        }

        if let chosen = validMatches.randomElement() {
            print("✅ Evolved to \(chosen.toId)")
            speciesId = chosen.toId
            applyStatGains(chosen.statGains)
            evolutionHistory.append(chosen.toId)
            stage = toStage
            stageStartDate = Date()
            return true
        } else if let fallback = fallback {
            print("🟠 Fallback evolution to \(fallback.toId)")
            speciesId = fallback.toId
            applyStatGains(fallback.statGains)
            evolutionHistory.append(fallback.toId)
            stage = toStage
            stageStartDate = Date()
            return true
        } else {
            print("💀 No evolution possible — pet dies.")
            speciesId = "GhostMon"
            stage = .dead
            isAlive = false
            evolutionHistory.append("GhostMon")
            return false
        }
    }

    func applyStatGains(_ gains: [String: Int]) {
        for (key, value) in gains {
            switch key.lowercased() {
            case "hunger": hunger += value
            case "caremistakes": careMistakes += value
            case "happiness": happiness += value
            case "discipline": discipline += value
            case "hp": hp += value
            case "mp": mp += value
            case "speed": speed += value
            case "defence": defence += value
            case "attack": attack += value
            case "knowledge": knowledge += value
            case "weight1": weight1 += value
                
            default: break
            }
        }
    }

    func ageDescription() -> String {
        switch stage {
        case .egg: return "Egg"
        case .baby: return "Baby"
        case .intraining: return "In Training"
        case .rookie: return "Rookie"
        case .champion: return "Champion"
        case .ultimate: return "Ultimate"
        case .mega: return "Mega"
        case .dead: return "Dead"
        }
    }
}
