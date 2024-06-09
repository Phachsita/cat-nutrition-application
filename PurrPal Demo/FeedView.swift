import SwiftUI

struct FeedView: View {
    @EnvironmentObject var foodEntryModel: FoodEntryModel
    @State private var showAddFoodForm = false
    @State private var showFeedingHistory = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("ให้อาหาร")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Spacer()

                if foodEntryModel.foodEntries.isEmpty {
                    HStack {
                        Spacer()
                        Text("ไม่พบข้อมูล")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(foodEntryModel.foodEntries, id: \.id) { foodEntry in
                            VStack(alignment: .leading) {
                                Text("\(foodEntry.brand) - \(foodEntry.formula)")
                                    .font(.headline)
                                Text("แคลอรี่: \(foodEntry.calories)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("วันที่: \(foodEntry.date, formatter: DateFormatter.feedDateFormatter)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("เวลา: \(foodEntry.date, formatter: DateFormatter.feedTimeFormatter)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                }

                Spacer()

                NavigationLink(destination: FeedingHistoryView(foodEntries: $foodEntryModel.foodEntries)) {
                    HStack {
                        Spacer()
                        Text("ดูประวัติการให้อาหาร")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Button(action: {
                    showAddFoodForm = true
                }) {
                    Text("ให้อาหาร")
                        .font(.headline)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 20) // Adjust the bottom padding as needed
                }
                .sheet(isPresented: $showAddFoodForm) {
                    AddFoodView(foodEntries: $foodEntryModel.foodEntries)
                        .environmentObject(foodEntryModel)
                }
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        foodEntryModel.foodEntries.remove(atOffsets: offsets)
    }
}

extension DateFormatter {
    static let feedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "th_TH")
        formatter.calendar = Calendar(identifier: .buddhist)
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    static let feedTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "th_TH")
        formatter.calendar = Calendar(identifier: .buddhist)
        formatter.dateFormat = "HH:mm น."
        return formatter
    }()
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView().environmentObject(FoodEntryModel())
    }
}
