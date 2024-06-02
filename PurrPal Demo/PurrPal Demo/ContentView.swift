import SwiftUI

struct ContentView: View {
    @StateObject private var foodEntryModel = FoodEntryModel()
    @StateObject private var vaccineCardModel = VaccineCardModel()
    @Binding var selectedCat: CatProfile?

    var body: some View {
        VStack {
            TabView {
                // Dashboard View
                DashboardView(selectedCat: $selectedCat)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("หน้าหลัก")
                    }
                    .environmentObject(foodEntryModel)
                    .environmentObject(vaccineCardModel)
                
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
                    .environmentObject(vaccineCardModel)
                
                // Illness View
                IllnessView()
                    .tabItem {
                        Image(systemName: "cross.fill")
                        Text("บันทึกการป่วย")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedCat: .constant(CatProfile(
            name: "ฝุ่น",
            gender: "ตัวผู้",
            neutered: true,
            birthdate: Date(),
            breed: "สยามนิส",
            weight: 4.5,
            profilePic: nil
        )))
            .environmentObject(FoodEntryModel())
            .environmentObject(VaccineCardModel())
    }
}
