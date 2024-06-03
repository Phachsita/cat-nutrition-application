import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var foodEntryModel: FoodEntryModel
    @Binding var selectedCat: CatProfile?
    @State private var showCatProfileSelection = false
    @State private var showEditWeightForm = false
    @State private var newWeight: String = ""

    var maxCalories: Double {
        if let cat = selectedCat {
            return 70 * pow(cat.weight, 0.75) // Adult cat DER formula
        }
        return 1000 // Default max calories
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        if let cat = selectedCat, let profilePicData = cat.profilePic, let uiImage = UIImage(data: profilePicData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 3)
                        } else {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 70, height: 70)
                        }

                        if let cat = selectedCat {
                            VStack(alignment: .leading) {
                                Text(cat.name)
                                    .font(.title)
                                    .fontWeight(.bold)

                            }
                        }
                        Spacer()
                        Button(action: {
                            showCatProfileSelection = true
                        }) {
                            Image(systemName: "cat.circle")
                                .font(.title)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding([.top, .horizontal])

                    // วงกลมแสดงพลังงานสะสมทั้งวัน
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 20)
                                .opacity(0.3)
                                .foregroundColor(.blue)

                            Circle()
                                .trim(from: 0.0, to: CGFloat(min(Double(foodEntryModel.totalCalories) / maxCalories, 1.0)))
                                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                .foregroundColor(Int(foodEntryModel.totalCalories) > Int(maxCalories) ? .red : .blue)
                                .rotationEffect(Angle(degrees: -90))
                                .animation(.linear, value: foodEntryModel.totalCalories)

                            VStack {
                                Text("\(foodEntryModel.totalCalories, specifier: "%.0f")/\(Int(maxCalories)) แคล")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Int(foodEntryModel.totalCalories) > Int(maxCalories) ? .red : .blue)
                                Text("พลังงานสะสมทั้งวัน")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                    }
                    .padding(.bottom)

                    // การนัดหมายที่ใกล้ที่สุด
                    VStack(alignment: .leading, spacing: 10) {
                        Text("การนัดหมายที่ใกล้ที่สุด")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        NavigationLink(destination: AppointmentView()) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.blue)
                                Text("ทำวัคซีนไข้หวัดหัดแมว, 05/06/2567")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .frame(minHeight: 100)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                    // ข้อมูลพื้นฐานของแมว
                    VStack(alignment: .leading, spacing: 10) {
                        Text("ข้อมูลพื้นฐานของแมว")
                            .font(.headline)
                            .padding(.bottom, 5)

                        if let cat = selectedCat {
                            InfoRow(label: "อายุ", value: "\(cat.age)")
                            InfoRow(label: "พันธุ์", value: "\(cat.breed)")
                        }
                    }
                    .padding()
                    .frame(minHeight: 100)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    // การ์ดน้ำหนัก
                    VStack(alignment: .leading, spacing: 10) {
                        Text("น้ำหนัก")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Spacer()
                            Text("\(String(format: "%.2f", selectedCat?.weight ?? 0)) กก.")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    if let cat = selectedCat {
                                        newWeight = String(format: "%.2f", cat.weight)
                                        showEditWeightForm = true
                                    }
                                }
                            Spacer()
                        }
                    }
                    .padding()
                    .frame(minHeight: 100)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .sheet(isPresented: $showEditWeightForm) {
                        EditWeightView(selectedCat: $selectedCat, newWeight: $newWeight)
                    }

                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showCatProfileSelection) {
            CatProfileSelectionView(selectedCat: $selectedCat)
                .environmentObject(CatDataModel())
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

struct EditWeightView: View {
    @Binding var selectedCat: CatProfile?
    @Binding var newWeight: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("น้ำหนักใหม่ (กก.)")) {
                    TextField("น้ำหนักใหม่", text: $newWeight)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("แก้ไขน้ำหนัก")
            .navigationBarItems(leading: Button("ยกเลิก") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("บันทึก") {
                if let weight = Double(newWeight), weight > 0 {
                    selectedCat?.weight = weight
                }
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

extension CatProfile {
    var ageMonths: Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.month], from: birthdate, to: now)
        return (ageComponents.month ?? 0) % 12
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
