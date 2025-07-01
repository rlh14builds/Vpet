import Foundation

// - Monster Database

let monsterDB: [String: Monster] = [
    "EggFire": Monster(id: "EggFire", displayName: "Egg (Fire)", imageName: "baby_Flare"),
  
    //baby
    "Botamon": Monster(id: "Botamon", displayName: "Botamon", imageName: "Botamon"),
    
    //In Training
    "Koromon": Monster(id: "Koromon", displayName: "Koromon", imageName: "Koromon"),
    
    //Rookie
    "Agumon": Monster(id: "Agumon", displayName: "Agumon", imageName: "Agumon"),
    
    //Champion
    "Greymon": Monster(id: "Greymon", displayName: "Greymon", imageName: "Greymon"),
    "Tyrannomon": Monster(id: "Tyrannomon", displayName: "Tyrannomon", imageName: "Tyrannomon"),
    
    
    //Ultimate

    "MetalGreymon": Monster(id: "MetalGreymon", displayName: "MetalGreymon", imageName: "MetalGreymon"),
    "RizeGreymon": Monster(id: "RizeGreymon", displayName: "RizeGreymon", imageName: "RizeGreymon"),
    "SkullGreymon": Monster(id: "SkullGreymon", displayName: "SkullGreymon", imageName: "SkullGreymon"),
    "MasterTyrannomon": Monster(id: "MasterTyrannomon", displayName: "MasterTyrannomon", imageName: "MasterTyrannomon"),
    "Triceramon": Monster(id: "Triceramon", displayName: "Triceramon", imageName: "Triceramon"),
    "Brachimon": Monster(id: "Brachimon", displayName: "Brachimon", imageName: "Brachimon"),
 
    //Mega
    "WarGreymon": Monster(id: "WarGreymon", displayName: "WarGreymon", imageName: "WarGreymon"),
    "Gaioumon": Monster(id: "Gaioumon", displayName: "Gaioumon", imageName: "Gaioumon"),
    "Titamon": Monster(id: "Titamon", displayName: "Titamon", imageName: "Titamon"),
    "Machinedramon": Monster(id: "Machinedramon", displayName: "Machinedramon", imageName: "Machinedramon"),
    "BlitzGreymon": Monster(id: "BlitzGreymon", displayName: "BlitzGreymon", imageName: "BlitzGreymon"),
    "ShineGreymon": Monster(id: "ShineGreymon", displayName: "ShineGreymon", imageName: "ShineGreymon"),
    "Dinomon": Monster(id: "Dinomon", displayName: "Dinomon", imageName: "Dinomon"),
    "Spinomon": Monster(id: "Spinomon", displayName: "Spinomon", imageName: "Spinomon"),
    "Breakdramon": Monster(id: "Breakdramon", displayName: "Breakdramon", imageName: "Breakdramon"),
    "Cannondramon": Monster(id: "Cannondramon", displayName: "Cannondramon", imageName: "Cannondramon"),
    "UltimateBrachimon": Monster(id: "UltimateBrachimon", displayName: "UltimateBrachimon", imageName: "UltimateBrachimon"),

 
    
 
]


// Evolution Rules
// .egg .baby .intraining .rookie .champion .ultimate .mega .dead

let evolutionRules: [EvolutionRule] = [

    
//Egg -> Baby
    // EggFire → BabyFlare
    EvolutionRule(
        fromId: "EggFire",
        toId: "Botamon",
        stage: .baby,
        conditions: [
           
         ],
         requiredMatches: 0,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),
    
    
//Baby -> In Training
    EvolutionRule(
        fromId: "Botamon",
        toId: "Koromon",
        stage: .intraining,
        conditions: [
         
         ],
         requiredMatches: 0,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    //In Training -> Rookie
    EvolutionRule(
        fromId: "Koromon",
        toId: "Agumon",
        stage: .rookie,
        conditions: [
           
         ],
         requiredMatches: 0,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    //Rookie -> Champion
    EvolutionRule(
        fromId: "Agumon",
        toId: "Greymon",
        stage: .champion,
        conditions: [
             { $0.hp >= 14400 },
             { $0.attack >= 1500 },
             { $0.defence >= 1500 },
             { $0.victories >= 15 },
             { $0.weight1 >= 20 },
             { $0.careMistakes <= 3 }
         ],
         requiredMatches: 4,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    EvolutionRule(
        fromId: "Agumon",
        toId: "Tyrannomon",
        stage: .champion,
        conditions: [
            { $0.hp >= 1200 },
            { $0.attack >= 150 },
            { $0.defence >= 150 },
            { $0.victories >= 15 },
            { $0.weight1 >= 20 },
            { $0.discipline <= 49 }
         ],
         requiredMatches: 4,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    //Champion -> Ultimate
    EvolutionRule(
        fromId: "Greymon",
        toId: "MetalGreymon",
        stage: .ultimate,
        conditions: [
            { $0.hp >= 28000 },
            { $0.attack >= 3300},
            { $0.defence >= 2100 },
            { $0.speed >= 2100 },
            { $0.victories >= 15 },
            { $0.weight1 >= 40 },
            { $0.careMistakes <= 1 }
           
         ],
         requiredMatches: 6,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    EvolutionRule(
        fromId: "Greymon",
        toId: "RizeGreymon",
        stage: .ultimate,
        conditions: [
            { $0.hp >= 1000 },
            { $0.mp >= 2500},
            { $0.attack >= 600},
            { $0.defence >= 700 },
            { $0.victories >= 30 },
            { $0.weight1 >= 40 },
            { $0.careMistakes <= 2 },
            { $0.discipline >= 40 },
         ],
         requiredMatches: 5,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    EvolutionRule(
        fromId: "Greymon",
        toId: "SkullGreymon",
        stage: .ultimate,
        conditions: [
            { $0.hp >= 3000 },
            { $0.mp >= 3000},
            { $0.attack >= 900},
            { $0.defence >= 900 },
            { $0.victories >= 30 },
            { $0.weight1 >= 44 },
            { $0.careMistakes >= 5 },
            { $0.discipline <= 39 },
         ],
         requiredMatches: 6,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    //Ultimate -> Mega
    
    EvolutionRule(
        fromId: "SkullGreymon",
        toId: "Machinedramon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),
    
    EvolutionRule(
        fromId: "SkullGreymon",
        toId: "Titamon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    EvolutionRule(
        fromId: "MetalGreymon",
        toId: "WarGreymon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),
    
        
    EvolutionRule(
        fromId: "MetalGreymon",
        toId: "Gaioumon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),
    
    EvolutionRule(
        fromId: "RizeGreymon",
        toId: "ShineGreymon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),
    
    EvolutionRule(
        fromId: "RizeGreymon",
        toId: "BlitzGreymon",
        stage: .mega,
        conditions: [
             { $0.mp >= 10 },
             { $0.knowledge >= 5 }
         ],
         requiredMatches: 2,
         isFallback: false,
         statGains: ["mp": 5, "knowledge": 2]
     ),

    
    
      
    // GhostMon is handled directly in Pet.swift on death
]
