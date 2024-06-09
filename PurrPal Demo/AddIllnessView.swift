import SwiftUI

struct AddIllnessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var illnesses: [Illness]
    @State private var description = ""
    @State private var date = Date()
    @State private var notes = ""
    
    var editIllness: Illness?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("อาการ")) {
                    TextField("อาการ", text: $description)
                }
                Section(header: Text("วันที่และเวลา")) {
                    DatePicker("Select Date and Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .environment(\.locale, Locale(identifier: "th_TH"))
                }
                Section(header: Text("หมายเหตุ")) {
                    TextField("หมายเหตุ", text: $notes)
                }
            }
            .navigationTitle(editIllness == nil ? "เพิ่มอาการป่วย" : "Edit Illness")
            .navigationBarItems(leading: Button("ยกเลิก") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("บันทึก") {
                if let editIllness = editIllness {
                    if let index = illnesses.firstIndex(where: { $0.id == editIllness.id }) {
                        illnesses[index].description = description
                        illnesses[index].date = date
                        illnesses[index].notes = notes
                    }
                } else {
                    let newIllness = Illness(description: description, date: date, notes: notes)
                    illnesses.append(newIllness)
                }
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let editIllness = editIllness {
                    description = editIllness.description
                    date = editIllness.date
                    notes = editIllness.notes
                }
            }
        }
    }
}

struct AddIllnessView_Previews: PreviewProvider {
    static var previews: some View {
        AddIllnessView(illnesses: .constant([]))
    }
}
