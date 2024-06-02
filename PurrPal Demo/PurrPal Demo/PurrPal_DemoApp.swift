import SwiftUI

@main
struct PurrPal_DemoApp: App {
    @StateObject private var foodEntryModel = FoodEntryModel()
    @StateObject private var catDataModel = CatDataModel()
    @State private var selectedCat: CatProfile? = nil

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(selectedCat: .constant(CatProfile(
                    name: "ฝุ่น",
                    gender: "ตัวผู้",
                    neutered: true,
                    birthdate: Date(),
                    breed: "สยามนิส",
                    weight: 4.5,
                    profilePic: nil
                )))
            }
        }
    }
}
