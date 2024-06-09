import SwiftUI

struct ContentView: View {
    @StateObject private var foodEntryModel = FoodEntryModel()
    @Binding var selectedCat: CatProfile?

    var body: some View {
        TabView {
            // Dashboard View
            DashboardView(selectedCat: $selectedCat)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("หน้าหลัก")
                }
                .environmentObject(foodEntryModel)
            
            // Feed View
            FeedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("ให้อาหาร")
                }
                .environmentObject(foodEntryModel)
            
            // Vaccine Book View
            VaccineView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("สมุดวัคซีน")
                }
            
            // Illness View
            IllnessView()
                .tabItem {
                    Image(systemName: "cross.fill")
                    Text("บันทึกการป่วย")
                }
        }
    }
}
