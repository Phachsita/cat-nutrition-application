import Foundation
import Combine

struct CatProfile: Identifiable, Codable {
    var id = UUID()
    var name: String
    var gender: String
    var neutered: Bool
    var birthdate: Date
    var breed: String
    var weight: Double
    var profilePic: Data?
    
    var age: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthdate, to: Date())
        return components.year ?? 0
    }
    
}


class CatDataModel: ObservableObject {
    @Published var catProfiles: [CatProfile] = []

    init() {
        loadProfiles()
    }

    func saveProfiles() {
        if let encoded = try? JSONEncoder().encode(catProfiles) {
            UserDefaults.standard.set(encoded, forKey: "catProfiles")
        }
    }

    func loadProfiles() {
        if let savedProfiles = UserDefaults.standard.data(forKey: "catProfiles"),
           let decodedProfiles = try? JSONDecoder().decode([CatProfile].self, from: savedProfiles) {
            catProfiles = decodedProfiles
        }
    }

    func addProfile(_ profile: CatProfile) {
        catProfiles.append(profile)
        saveProfiles()
    }
}


//class CatData: ObservableObject {
//    @Published var catProfiles: [CatProfile] = []
//
//    init() {
//        loadProfiles()
//    }
//
//    func saveProfiles() {
//        if let encoded = try? JSONEncoder().encode(catProfiles) {
//            UserDefaults.standard.set(encoded, forKey: "catProfiles")
//        }
//    }
//
//    func loadProfiles() {
//        if let savedProfiles = UserDefaults.standard.data(forKey: "catProfiles"),
//           let decodedProfiles = try? JSONDecoder().decode([CatProfile].self, from: savedProfiles) {
//            catProfiles = decodedProfiles
//        }
//    }
//
//    func addProfile(_ profile: CatProfile) {
//        catProfiles.append(profile)
//        saveProfiles()
//    }
//}



