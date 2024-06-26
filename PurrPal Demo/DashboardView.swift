import SwiftUI

struct DashboardView: View {
    @Binding var selectedCat: CatProfile?

    @EnvironmentObject var foodEntryModel: FoodEntryModel
    @State private var showCatProfileSelection = false
    @State private var showEditWeightForm = false
    @State private var newWeight: String = ""

    var maxCalories: Double {
        if let cat = selectedCat {
            if cat.age > 1 { // Age is in years
                return (70 * pow(cat.weight, 0.75)) * 1.2 // Adult cat DER formula
            } else {
                return (70 * pow(cat.weight, 0.75)) * 2.5 // Kitten DER formula
            }
        }
        return 1000 // Default max calories
    }

    var body: some View {
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

                VStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .opacity(0.3)
                            .foregroundColor(.blue)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(Double(foodEntryModel.totalCalories) / maxCalories, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Int(foodEntryModel.totalCalories) > Int(maxCalories) ? .red : .orange)
                            .rotationEffect(Angle(degrees: -90))
                            .animation(.linear, value: foodEntryModel.totalCalories)

                        VStack {
                            Text("\(foodEntryModel.totalCalories, specifier: "%.0f")/\(Int(maxCalories))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Int(foodEntryModel.totalCalories) > Int(maxCalories) ? .red : .orange)
                            Text("กิโลแคลอรี")
                                .font(.body)
                                .foregroundColor(Int(foodEntryModel.totalCalories) > Int(maxCalories) ? .red : .orange)
                            Text("พลังงานสะสมทั้งวัน")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                }
                .padding(.bottom)

                VStack(alignment: .leading, spacing: 10) {
                    Text("การนัดหมายที่ใกล้ที่สุด")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    NavigationLink(destination: AppointmentView()) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            Text("ตรวจสอบนัดหมายที่นี่")
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
        .sheet(isPresented: $showCatProfileSelection) {
            CatProfileSelectionView()
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
