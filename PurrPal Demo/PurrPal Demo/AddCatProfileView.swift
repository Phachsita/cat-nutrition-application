import SwiftUI

struct AddCatProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var catProfiles: [CatProfile]
    
    @State private var profilePic: UIImage?
    @State private var name: String = ""
    @State private var gender: String = "ตัวผู้"
    @State private var neutered: Bool = false
    @State private var birthdate: Date = Date()
    @State private var breed: String = ""
    @State private var weight: String = ""
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("รูปโปรไฟล์")) {
                        if let image = profilePic {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showingImagePicker = true
                                }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showingImagePicker = true
                                }
                        }
                    }
                    Section(header: Text("Name")) {
                        TextField("Name", text: $name)
                    }
                    Section(header: Text("เพศ")) {
                        Picker("เพศ", selection: $gender) {
                            Text("ตัวผู้").tag("ตัวผู้")
                            Text("ตัวเมีย").tag("ตัวเมีย")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("ทำหมัน")) {
                        Toggle("ทำหมันแล้ว", isOn: $neutered)
                    }
                    Section(header: Text("วันเกิด")) {
                        DatePicker("วันเกิด", selection: $birthdate, displayedComponents: .date)
                    }
                    Section(header: Text("สายพันธุ์")) {
                        TextField("สายพันธุ์", text: $breed)
                    }
                    Section(header: Text("นำ้หนัก (กิโลกรัม)")) {
                        TextField("นำ้หนัก (กิโลกรัม)", text: $weight)
                            .keyboardType(.decimalPad)
                    }
                }
                .navigationTitle("เพิ่มโปรไฟล์แมว")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("ยกเลิก")
                }, trailing: Button(action: saveProfile) {
                    Text("บันทึก")
                })
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $profilePic)
                }
            }
        }
    }
    
    private func saveProfile() {
        guard let weightDouble = Double(weight) else { return }
        let newProfile = CatProfile(
            name: name,
            gender: gender,
            neutered: neutered,
            birthdate: birthdate,
            breed: breed,
            weight: weightDouble,
            profilePic: profilePic?.jpegData(compressionQuality: 0.8)
        )
        catProfiles.append(newProfile)
        presentationMode.wrappedValue.dismiss()
    }
}
