import SwiftUI

struct AddFoodView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var foodEntries: [FoodEntry]

    @State private var selectedBrand: String?
    @State private var selectedFormula: BrandFormula?
    @State private var quantity: String = ""

    var body: some View {
        VStack {
            Text("เลือกอาหาร")
                .font(.title2)
                .padding(.top, 20)

            Form {
                Section(header: Text("ยี่ห้อ").font(.headline).padding(.bottom, 5)) {
                    Picker("ยี่ห้อ", selection: $selectedBrand) {
                        ForEach(Array(Set(allBrandFormulas.map { $0.brand })), id: \.self) { brand in
                            Text(brand).tag(brand as String?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(height: 100)
                    .padding(.horizontal)
                }

                if let brand = selectedBrand {
                    Section() {
                        HStack {
                            Spacer()
                            Picker("สูตรอาหาร:", selection: $selectedFormula) {
                                ForEach(allBrandFormulas.filter { $0.brand == brand }, id: \.self) { brandFormula in
                                    Text(brandFormula.formula)
                                        .font(.body)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        .tag(brandFormula as BrandFormula?)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.horizontal)

                        if let brandFormula = selectedFormula {
                            if let url = URL(string: brandFormula.imageUrl) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 150)
                                        .frame(maxWidth: .infinity)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity)
                            }

                            Section() {
                                HStack {
                                    Text("ปริมาณ: ")
                                    Spacer()
                                    TextField("กรัม", text: $quantity)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .keyboardType(.decimalPad)
                                        .frame(maxWidth: .infinity)
                                }
                                .padding(.horizontal)

                                Button(action: {
                                    if let quantityValue = Double(quantity) {
                                        let newFoodEntry = FoodEntry(
                                            brand: brand,
                                            formula: brandFormula.formula,
                                            calories: Int(brandFormula.calories * quantityValue / 100),
                                            date: Date()
                                        )
                                        foodEntries.append(newFoodEntry)
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }) {
                                    Text("บันทึก")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.orange)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Log Meals")
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(foodEntries: .constant([]))
    }
}
