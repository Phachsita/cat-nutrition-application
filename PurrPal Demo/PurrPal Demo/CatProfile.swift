import Foundation
import SwiftUI

struct CatProfile: Codable, Identifiable {
    var id = UUID()
    var name: String
    var gender: String
    var neutered: Bool
    var birthdate: Date
    var breed: String
    var weight: Double
    var profilePic: Data?
    
    
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
    
    
    var Catage: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthdate, to: Date())
        return components.year ?? 0
    }
    
}

    
