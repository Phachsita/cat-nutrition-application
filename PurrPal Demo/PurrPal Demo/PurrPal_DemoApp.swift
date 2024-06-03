import SwiftUI

@main
struct PurrPal_DemoApp: App {
    @State private var selectedCat: CatProfile? = nil

    var body: some Scene {
        WindowGroup {
            InitialView()
        }
    }
}




struct InitialView: View {
    @StateObject private var foodEntryModel = FoodEntryModel()
    @StateObject private var catDataModel = CatDataModel()
    @State private var selectedCat: CatProfile? = nil

    var body: some View {
        if selectedCat == nil {
            CatProfileSelectionView(selectedCat: $selectedCat)
                .environmentObject(catDataModel)
                .environmentObject(foodEntryModel)
        } else {
            ContentView(selectedCat: $selectedCat)
                .environmentObject(catDataModel)
                .environmentObject(foodEntryModel)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
