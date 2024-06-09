import SwiftUI

struct FeedingHistoryView: View {
    @Binding var foodEntries: [FoodEntry]
    @State private var selectedDate = Date()
    @State private var showDatePicker = false

    // Filter food entries by the selected date
    var filteredEntries: [FoodEntry] {
        foodEntries.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }
    }

    var body: some View {
        VStack {
            // Toggle to show or hide date picker
            Button(action: {
                withAnimation {
                    showDatePicker.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("ค้นหาจากวันที่")
                        .font(.headline)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .foregroundColor(.black)
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .padding(.top)

            // Date picker to select the filter date
            if showDatePicker {
                DatePicker(
                    "เลือกวันที่",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                .transition(.slide)
            }

            if filteredEntries.isEmpty {
                Text("ไม่มีข้อมูล")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 50)
            } else {
                List {
                    ForEach(filteredEntries) { foodEntry in
                        FoodEntryView(foodEntry: foodEntry)
                    }
                    .onDelete(perform: deleteItems)
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }

            Spacer()
        }
        .navigationTitle("ประวัติการให้อาหาร")
        .padding()
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        .toolbar {
            EditButton()
        }
        .environment(\.locale, Locale(identifier: "th_TH"))
        .environment(\.calendar, Calendar(identifier: .buddhist))
    }
    
    private func deleteItems(at offsets: IndexSet) {
        foodEntries.remove(atOffsets: offsets)
    }
}

struct FoodEntryView: View {
    let foodEntry: FoodEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(foodEntry.brand) - \(foodEntry.formula)")
                .font(.headline)
                .padding(.bottom, 2)
            Text("แคลอรี่: \(foodEntry.calories)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("วันที่: \(foodEntry.date, formatter: DateFormatter.thaiDateFormatter)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("เวลา: \(foodEntry.date, formatter: DateFormatter.shortTimeFormatter)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }


    }
}

struct FeedingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        FeedingHistoryView(foodEntries: .constant([
            FoodEntry(brand: "ROYAL CANIN", formula: "Kitten", calories: 400, date: Date()),
            FoodEntry(brand: "Me-O", formula: "Adult", calories: 350, date: Date().addingTimeInterval(-86400)) // 1 day ago
        ]))
    }
}


extension DateFormatter {
    static let thaiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "th_TH")
        formatter.calendar = Calendar(identifier: .buddhist)
        return formatter
    }()

    static let shortTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
