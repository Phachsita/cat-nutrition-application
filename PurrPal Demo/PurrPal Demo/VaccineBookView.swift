import SwiftUI

struct VaccineView: View {
    @State private var vaccineCards: [VaccineCard] = []
    @State private var isShowingAddCardForm = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(vaccineCards) { card in
                        VaccineCardView(card: card)
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: AppointmentView()) {
                    Text("เพิ่มนัดหมาย")
                        .font(.headline)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
            .navigationTitle("สมุดวัคซีน")
            .navigationBarItems(trailing: Button(action: {
                isShowingAddCardForm = true
            }) {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.orange)
            })
            .sheet(isPresented: $isShowingAddCardForm) {
                AddVaccineCardForm { newCard in
                    vaccineCards.append(newCard)
                }
            }
        }
    }
}



struct AddVaccineCardForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    @State private var detail = ""
    @State private var location = ""
    @State private var batch = ""
    @State private var note = ""
    @State private var theme = Color.orange
    
    var onSave: (VaccineCard) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("วันที่")) {
                    DatePicker("เลือกวันที่", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .environment(\.locale, Locale(identifier: "th_TH"))
                }
                Section(header: Text("ชื่อวัคซีน")) {
                    TextField("ชื่อวัคซีน", text: $detail)
                }
                Section(header: Text("สถานพยาบาล")) {
                    TextField("สถานพยาบาล", text: $location)
                }
                Section(header: Text("หมายเลขชุดผลิต")) {
                    TextField("หมายเลขชุดผลิต", text: $batch)
                }
                Section(header: Text("หมายเหตุ")) {
                    TextField("หมายเหตุ", text: $note)
                }
//                Section(header: Text("สีของธีม")) {
//                    ColorPicker("เลือกสี", selection: $theme)
//                }
            }
            .navigationTitle("เพิ่มวัคซีน")
            .navigationBarItems(leading: Button("ยกเลิก") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("บันทึก") {
                let calendar = Calendar(identifier: .buddhist)
                let components = calendar.dateComponents([.day, .month, .year], from: selectedDate)
                if let dateInt = components.day, let _ = components.month, let yearInt = components.year {
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "th_TH")
                    formatter.dateFormat = "MMMM"
                    let monthString = formatter.string(from: selectedDate)
                    let newCard = VaccineCard(date: dateInt, month: monthString, year: yearInt, detail: detail, location: location, theme: theme, batch: batch, note: note)
                    onSave(newCard)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct VaccineCard: Identifiable {
    let id = UUID()
    var date: Int
    var month: String
    var year: Int
    var detail: String
    var location: String
    var theme: Color
    var batch: String
    var note: String
}

struct VaccineCardView: View {
    var card: VaccineCard
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // Date Section
                VStack {
                    Text(String(card.date))
                        .font(.system(size: 32))
                        .foregroundColor(card.theme)
                        .fontWeight(.bold)
                    Text(card.month)
                        .foregroundColor(card.theme)
                    Text(String(card.year))
                        .foregroundColor(card.theme)
                }
                .padding()
                
                // Divider Line
                Rectangle()
                    .fill(card.theme)
                    .frame(width: 4)
                
                // Text Section
                VStack(alignment: .leading, spacing: 5) {
                    Text(card.detail)
                        .font(.headline)
                    Text(card.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("หมายเลขชุดผลิต: \(card.batch)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("หมายเหตุ: \(card.note)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Spacer()
                
                // Image (if needed)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal)
            .padding(.top, 10)
        }
        .frame(height: 150) // Set the height of the card
    }
}


struct VaccineView_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView()
    }
}
