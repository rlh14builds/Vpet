import SwiftUI

struct PetView: View {
    @ObservedObject var pet: Pet

    var body: some View {
        VStack(spacing: 8) {
            // Pet Image in Fixed Container
            ZStack {
                Color.clear
                    .frame(width: 100, height: 100)

                Image(monsterDB[pet.speciesId]?.imageName ?? "placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(pet.ageDescription())
                            .font(.caption)
                            .padding(4)
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white),
                        alignment: .bottom
                    )
            }

            // Display name
            Text(pet.displayName)
                .font(.headline)

            // Stats grid
            VStack(spacing: 2) {
                HStack(spacing: 8) {
                    StatLabel(abbr: "HGR", value: pet.hunger)
                    StatLabel(abbr: "HAP", value: pet.happiness)
                    StatLabel(abbr: "CMS", value: pet.careMistakes)
                }
                HStack(spacing: 8) {
                    StatLabel(abbr: "DSP", value: pet.discipline)
                    StatLabel(abbr: "HP", value: pet.hp)
                    StatLabel(abbr: "MP", value: pet.mp)
                }
                HStack(spacing: 8) {
                    StatLabel(abbr: "SPD", value: pet.speed)
                    StatLabel(abbr: "DEF", value: pet.defence)
                    StatLabel(abbr: "KNW", value: pet.knowledge)
                  
                    
                }
                HStack(spacing: 8) {
    
                    StatLabel(abbr: "VIC", value: pet.victories)
                    StatLabel(abbr: "WHT", value: pet.weight1)
                    
                }
            }
            .font(.caption2)

            // Evolution history
            Text("History:")
                .font(.caption2)
                .bold()
                .padding(.top, 4)

            ForEach(pet.evolutionHistory, id: \.self) { id in
                Text(monsterDB[id]?.displayName ?? id)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(4)
        .frame(minWidth: 120)
    }
}

struct StatLabel: View {
    var abbr: String
    var value: Int

    var body: some View {
        Text("\(abbr): \(value)")
            .frame(minWidth: 40, alignment: .leading)
    }
}
