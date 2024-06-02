import SwiftUI
import Foundation
import Combine

class FoodEntryModel: ObservableObject {
    @Published var foodEntries: [FoodEntry] = []

    var totalCalories: Int {
        foodEntries.reduce(0) { $0 + $1.calories }
    }

    init() {
        self.foodEntries = [
            FoodEntry(brand: "ROYAL CANIN", formula: "Kitten", calories: 400, date: Date()),
            FoodEntry(brand: "Me-O", formula: "Adult", calories: 350, date: Date().addingTimeInterval(-86400)) // 1 day ago
        ]
    }
}

struct FoodEntry: Identifiable {
    let id = UUID()
    let brand: String
    let formula: String
    let calories: Int
    let date: Date
}
