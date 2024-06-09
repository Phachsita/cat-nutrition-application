import SwiftUI

struct AppointmentView: View {
    @State private var appointments: [Appointment] = [
//        Appointment(date: 12, month: "มกราคม", year: 2566, detail: "ตรวจสุขภาพ", location: "คลินิกเพ็ทโฮม", theme: .orange),
//        Appointment(date: 1, month: "มกราคม", year: 2566, detail: "ฉีดวัคซีน", location: "โรงพยาบาลสัตว์เกษตร", theme: .blue),
//        Appointment(date: 3, month: "มีนาคม", year: 2566, detail: "ติดตามผล", location: "คลินิกเพ็ทโฮม", theme: .red),
//        Appointment(date: 30, month: "ธันวาคม", year: 2566, detail: "ตรวจสุขภาพประจำปี", location: "คลินิกเพ็ทโฮม", theme: .orange),
//        Appointment(date: 12, month: "ธันวาคม", year: 2566, detail: "ฉีดวัคซีน", location: "คลินิกเพ็ทโฮม", theme: .orange)
    ]
    @State private var isShowingAddAppointmentForm = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if appointments.isEmpty {
                    VStack {
                        Spacer()
                        Text("ไม่พบข้อมูล")
                            .font(.body)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(appointments) { appointment in
                            AppointmentCardView(appointment: appointment)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                }

                Spacer()
            }
            .navigationTitle("นัดหมาย")
            .navigationBarItems(trailing: Button(action: {
                isShowingAddAppointmentForm = true
            }) {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.orange)
            })
            .sheet(isPresented: $isShowingAddAppointmentForm) {
                AddAppointmentForm { newAppointment in
                    appointments.append(newAppointment)
                }
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        appointments.remove(atOffsets: offsets)
    }
}

struct AddAppointmentForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var detail = ""
    @State private var location = ""
    @State private var theme = Color.orange

    var onSave: (Appointment) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("วันที่")) {
                    DatePicker("เลือกวันที่", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .environment(\.locale, Locale(identifier: "th_TH"))
                }
                Section(header: Text("เวลา")) {
                    DatePicker("เลือกเวลา", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .environment(\.locale, Locale(identifier: "th_TH"))
                }
                Section(header: Text("รายละเอียด")) {
                    TextField("รายละเอียด", text: $detail)
                }
                Section(header: Text("สถานที่")) {
                    TextField("สถานที่", text: $location)
                }
                Section(header: Text("สีของธีม")) {
                    ColorPicker("เลือกสี", selection: $theme)
                }
            }
            .navigationTitle("เพิ่มนัดหมาย")
            .navigationBarItems(trailing: Button("บันทึก") {
                let calendar = Calendar(identifier: .buddhist)
                let dateTime = Calendar.current.date(bySettingHour: calendar.component(.hour, from: selectedTime), minute: calendar.component(.minute, from: selectedTime), second: 0, of: selectedDate) ?? selectedDate
                let newAppointment = Appointment(date: dateTime, detail: detail, location: location, theme: theme)
                onSave(newAppointment)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct Appointment: Identifiable {
    let id = UUID()
    var date: Date
    var detail: String
    var location: String
    var theme: Color
}

struct AppointmentCardView: View {
    var appointment: Appointment

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // วันที่
                VStack {
                    Text(dayFormatter.string(from: appointment.date))
                        .font(.system(size: 32))
                        .foregroundColor(appointment.theme)
                        .fontWeight(.bold)
                    Text(shortMonthFormatter.string(from: appointment.date))
                        .foregroundColor(appointment.theme)
                    Text(yearFormatter.string(from: appointment.date))
                        .foregroundColor(appointment.theme)
                    Text(appointmentTimeFormatter.string(from: appointment.date))
                        .font(.caption)
                        .foregroundColor(appointment.theme)
                }
                .padding()

                // ส่วนของข้อความ
                VStack(alignment: .leading) {
                    Text(appointment.detail)
                        .font(.headline)
                        .padding(.bottom, 2)
                    Text(appointment.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                }
                .padding()

                Spacer()

                // ภาพ (ถ้าจำเป็น)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding()
            .frame(height: 150) // ตั้งค่าความสูงของการ์ด
        }
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}

// Formatters
private let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "th_TH")
    formatter.dateFormat = "d"
    formatter.calendar = Calendar(identifier: .buddhist)
    return formatter
}()

private let shortMonthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "th_TH")
    formatter.dateFormat = "MMM"
    formatter.calendar = Calendar(identifier: .buddhist)
    return formatter
}()

private let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "th_TH")
    formatter.dateFormat = "yyyy"
    formatter.calendar = Calendar(identifier: .buddhist)
    return formatter
}()

private let appointmentTimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "th_TH")
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    formatter.calendar = Calendar(identifier: .buddhist)
    return formatter
}()
