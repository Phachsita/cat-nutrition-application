import SwiftUI

struct IllnessView: View {
    @State private var showAddIllnessForm = false
    @State private var showEditIllnessForm = false
    @State private var illnesses: [Illness] = [
//        Illness(description: "มีไข้", date: Date().addingTimeInterval(-86400), notes: "อุณหภูมิสูงและไม่มีแรง"), // ตัวอย่างข้อมูลย้อนหลัง 1 วัน
//        Illness(description: "อาเจียน", date: Date(), notes: "อาเจียนสองครั้งหลังจากกิน")
    ]
    @State private var selectedIllness: Illness?

    var groupedIllnesses: [String: [Illness]] {
        Dictionary(grouping: illnesses.sorted(by: { $0.date > $1.date })) { illness in
            DateFormatter.thaiDateFormatter.string(from: illness.date)
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if illnesses.isEmpty {
                    VStack {
                        Spacer()
                        Text("ไม่พบข้อมูล")
                            .font(.body)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(groupedIllnesses.keys.sorted(by: { DateFormatter.thaiDateFormatter.date(from: $0)! > DateFormatter.thaiDateFormatter.date(from: $1)! }), id: \.self) { key in
                            Section(header: Text(key).font(.headline)) {
                                ForEach(groupedIllnesses[key]!, id: \.id) { illness in
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(illness.description)
                                            .font(.headline)
                                        Text("เวลา: \(illness.date, formatter: DateFormatter.shortTimeFormatter)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text("หมายเหตุ: \(illness.notes)")
                                            .font(.subheadline)
                                    }
                                    .padding()
                                    .contextMenu {
                                        Button(action: {
                                            selectedIllness = illness
                                            showEditIllnessForm = true
                                        }) {
                                            Text("แก้ไข")
                                            Image(systemName: "pencil")
                                        }
                                        Button(action: {
                                            if let index = illnesses.firstIndex(where: { $0.id == illness.id }) {
                                                illnesses.remove(at: index)
                                            }
                                        }) {
                                            Text("ลบ")
                                            Image(systemName: "trash")
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 10)
                }

                Spacer()
            }
            .navigationTitle("บันทึกการป่วย")
            .navigationBarItems(trailing: Button(action: {
                showAddIllnessForm = true
            }) {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.orange)
            })
            .sheet(isPresented: $showAddIllnessForm) {
                AddIllnessView(illnesses: $illnesses)
            }
            .sheet(isPresented: $showEditIllnessForm) {
                if let selectedIllness = selectedIllness {
                    AddIllnessView(illnesses: $illnesses, editIllness: selectedIllness)
                }
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            let key = groupedIllnesses.keys.sorted(by: { DateFormatter.thaiDateFormatter.date(from: $0)! > DateFormatter.thaiDateFormatter.date(from: $1)! })[offset]
            if let illnessesToDelete = groupedIllnesses[key] {
                for illness in illnessesToDelete {
                    if let index = illnesses.firstIndex(where: { $0.id == illness.id }) {
                        illnesses.remove(at: index)
                    }
                }
            }
        }
    }
}

struct Illness: Identifiable {
    let id = UUID()
    var description: String
    var date: Date
    var notes: String
}



struct IllnessView_Previews: PreviewProvider {
    static var previews: some View {
        IllnessView()
    }
}
