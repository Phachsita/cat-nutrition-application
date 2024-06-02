import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var foodEntryModel: FoodEntryModel
    @Binding var selectedCat: CatProfile?

    var body: some View {
        NavigationView { // เพิ่ม NavigationView ที่นี่
            VStack {
                if let cat = selectedCat {
                    // ชื่อแมว
                    Text(cat.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                }

                // วงกลมแสดงพลังงานสะสมทั้งวัน
                VStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .opacity(0.3)
                            .foregroundColor(.blue)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(Double(foodEntryModel.totalCalories) / 1000, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.blue)
                            .rotationEffect(Angle(degrees: -90))
                            .animation(.linear, value: foodEntryModel.totalCalories)

                        Text("\(foodEntryModel.totalCalories) แคล")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .frame(width: 150, height: 150)
                    .padding()

                    Text("พลังงานสะสมทั้งวัน")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()

                // การนัดหมายที่ใกล้ที่สุด
                VStack {
                    Text("การนัดหมายที่ใกล้ที่สุด")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    NavigationLink(destination: AppointmentView()) {
                        Text("คุณหมอสมิธ, 5 มิถุนายน 2024")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                // ข้อมูลพื้นฐานของแมว
                VStack(alignment: .leading, spacing: 10) {
                    Text("ข้อมูลพื้นฐานของแมว")
                        .font(.headline)
                        .padding(.bottom, 5)

                    if let cat = selectedCat {
                        InfoRow(label: "อายุ", value: "\(cat.age) ปี")
                        InfoRow(label: "น้ำหนัก", value: "\(cat.weight) กก.")
                        InfoRow(label: "พันธุ์", value: "\(cat.breed)")
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("แดชบอร์ด")
            .padding()
        }
    }
}

struct InfoRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .font(.subheadline)
                .bold()
                .foregroundColor(.primary)
            Text(value)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(selectedCat: .constant(CatProfile(
            name: "ฝุ่น",
            gender: "ตัวผู้",
            neutered: true,
            birthdate: Date(),
            breed: "สยามนิส",
            weight: 4.5,
            profilePic: nil
        )))
        .environmentObject(FoodEntryModel())
    }
}
