import SwiftUI

struct ContentView: View {
    @StateObject var pet1 = Pet()
    @StateObject var pet2 = Pet()
    @State private var selectedPetIndex = 0 // 0 for pet1, 1 for pet2

    // Timer to update evolution
    let timer = Timer.publish(every: 60, on: RunLoop.main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Pet Slots
            HStack {
                PetView(pet: pet1)
                PetView(pet: pet2)
            }
            .frame(height: 200)
            
            HStack {
                Text("Editing Pet \(selectedPetIndex + 1)")
                    .font(.caption)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)

                Button("Switch") {
                    selectedPetIndex = (selectedPetIndex + 1) % 2
                }
                .padding(6)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
            }

            // Debug Grid
            VStack(spacing: 10) {
                ForEach(0..<5) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            if index < debugButtonTitles.count {
                                DebugButton(title: debugButtonTitles[index]) {
                                    debugButtonActions[index]()
                                }
                            }
                        }
                    }
                }
            }
            .padding()

            Spacer()

            // Bottom Navigation
            HStack {
                Spacer()
                Text("Quest")
                Spacer()
                Text("Inventory")
                Spacer()
                Text("Tamer")
                Spacer()
                Text("Settings")
                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.1))
        }
        .onReceive(timer) { _ in
            pet1.updateStage()
            pet2.updateStage()
        }
    }

    // MARK: - Debug Buttons

    let debugButtonTitles = [
        "Feed", "Scold", "Play",
        "Train HP", "Train MP", "Train Speed",
        "Train Def", "Train Know", "Mistake++",
        "To Baby", "To InTrain", "To Rookie",
        "To Champion", "To Ultimate", "To Mega"
    ]

    var selectedPet: Pet {
        selectedPetIndex == 0 ? pet1 : pet2
    }

    var debugButtonActions: [() -> Void] {
        [
            { selectedPet.hunger = max(0, selectedPet.hunger - 1) },
            { selectedPet.discipline += 1 },
            { selectedPet.happiness += 10 },
            { selectedPet.hp += 1 },
            { selectedPet.mp += 1 },
            { selectedPet.speed += 1 },
            { selectedPet.defence += 1 },
            { selectedPet.knowledge += 1 },
            { selectedPet.careMistakes += 1 },
            { selectedPet.tryEvolve(toStage: .baby) },
            { selectedPet.tryEvolve(toStage: .intraining) },
            { selectedPet.tryEvolve(toStage: .rookie) },
            { selectedPet.tryEvolve(toStage: .champion) },
            { selectedPet.tryEvolve(toStage: .ultimate) },
            { selectedPet.tryEvolve(toStage: .mega) }
        ]
    }
}
