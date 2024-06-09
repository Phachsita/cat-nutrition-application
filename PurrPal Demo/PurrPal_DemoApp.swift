import SwiftUI

@main
struct PurrPal_DemoApp: App {
    @State private var selectedCat: CatProfile? = nil
    @StateObject private var profileManager = CatProfileManager()
    @StateObject private var catData = CatDataModel()
    @State private var showingAddCatProfileView = false

    var body: some Scene {
        WindowGroup {
            InitialView(selectedCat: $selectedCat)
                .environmentObject(CatDataModel())
                .environmentObject(FoodEntryModel())
        }
    }
}

struct InitialView: View {
    @EnvironmentObject private var foodEntryModel: FoodEntryModel
    @EnvironmentObject private var catDataModel: CatDataModel
    @Binding var selectedCat: CatProfile?

    var body: some View {
        if selectedCat == nil {
            CatProfileSelectionView()
        } else {
            ContentView(selectedCat: $selectedCat)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(selectedCat: .constant(nil))
            .environmentObject(CatDataModel())
            .environmentObject(FoodEntryModel())
    }
}

