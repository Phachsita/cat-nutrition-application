import Foundation
import SwiftUI

struct CatProfile: Identifiable {
    let id = UUID()
    let name: String
    let gender: String
    let neutered: Bool
    let birthdate: Date
    let breed: String
    var weight: Double
    let profilePic: Data?

    var age: String {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year, .month], from: birthdate, to: now)
        let years = ageComponents.year ?? 0
        let months = ageComponents.month ?? 0
        return "\(years) ปี \(months) เดือน"
    }
    
    var ageInYears: Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthdate, to: now)
        return ageComponents.year ?? 0
    }
}
