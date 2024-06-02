import Foundation
import SwiftUI

struct CatProfile: Identifiable {
    let id = UUID()
    let name: String
    let gender: String
    let neutered: Bool
    let birthdate: Date
    let breed: String
    let weight: Double
    let profilePic: Data?

    var age: Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthdate, to: now)
        return ageComponents.year!
    }
}
