import SwiftUI
import Foundation

// Cat model
struct Cat: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var weight: Double
    var breed: String
    var profilePic: UIImage?
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



//struct CatProfileRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CatProfileRow(profile: Cat(name: "Phun", age: 3, weight: 4.5, breed: "Siamese"), isSelected: true)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
