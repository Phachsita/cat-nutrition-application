import SwiftUI
import Foundation
import Combine

class FoodEntryModel: ObservableObject {
    @Published var foodEntries: [FoodEntry] = []
    @Published var totalCalories: Double = 0.0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $foodEntries
            .map { entries in
                entries.reduce(0) { $0 + Double($1.calories) }
            }
            .assign(to: \.totalCalories, on: self)
            .store(in: &cancellables)
    }
}

struct FoodEntry: Identifiable {
    var id = UUID()
    var brand: String
    var formula: String
    var calories: Int
    var date: Date
}
