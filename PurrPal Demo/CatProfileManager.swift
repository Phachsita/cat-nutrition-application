import Foundation
class CatProfileManager: ObservableObject {
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
