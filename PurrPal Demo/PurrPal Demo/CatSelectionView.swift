import SwiftUI

struct CatProfileSelectionView: View {
    @StateObject var catData = CatDataModel()
    @State private var showingAddCatProfileView = false
    @Binding var selectedCat: CatProfile?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(catData.catProfiles) { profile in
                        NavigationLink(destination: DashboardView(selectedCat: $selectedCat).onAppear {
                            selectedCat = profile
                        }) {
                            HStack {
                                if let imageData = profile.profilePic, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }
                                VStack(alignment: .leading) {
                                    Text(profile.name)
                                        .font(.headline)
                                    Text(profile.breed)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteProfile)
                }
                Button(action: {
                    showingAddCatProfileView = true
                }) {
                    Text("เพิ่มโปรไฟล์")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .sheet(isPresented: $showingAddCatProfileView) {
                    AddCatProfileView(catProfiles: $catData.catProfiles)
                }
            }
            .navigationTitle("เลือกแมว")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func deleteProfile(at offsets: IndexSet) {
        catData.catProfiles.remove(atOffsets: offsets)
        catData.saveProfiles()
    }
}



struct EditCatProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    var profile: CatProfile
    @Binding var catProfiles: [CatProfile]
    
    @State private var profilePic: UIImage?
    @State private var name: String
    @State private var gender: String
    @State private var neutered: Bool
    @State private var birthdate: Date
    @State private var breed: String
    @State private var weight: String
    @State private var showingImagePicker = false

    let catBreeds = ["ไทย", "เปอร์เซีย", "สก็อตติช โฟลด์", "เมนคูน", "เบงกอล", "แร็กดอลล์", "บริติช ชอร์ตแฮร์", "อเมริกัน ชอร์ตแฮร์", "รัสเซียน บลู", "สยามนิส"]

    init(profile: CatProfile, catProfiles: Binding<[CatProfile]>) {
        self.profile = profile
        self._catProfiles = catProfiles
        self._name = State(initialValue: profile.name)
        self._gender = State(initialValue: profile.gender)
        self._neutered = State(initialValue: profile.neutered)
        self._birthdate = State(initialValue: profile.birthdate)
        self._breed = State(initialValue: profile.breed)
        self._weight = State(initialValue: String(profile.weight))
        if let data = profile.profilePic, let image = UIImage(data: data) {
            self._profilePic = State(initialValue: image)
        }
    }
    
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
                    Section(header: Text("ชื่อ")) {
                        TextField("ชื่อ", text: $name)
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
                            .environment(\.locale, Locale(identifier: "th_TH"))
                            .environment(\.calendar, Calendar(identifier: .buddhist))
                    }
                    Section(header: Text("สายพันธุ์")) {
                        Picker("สายพันธุ์", selection: $breed) {
                            ForEach(catBreeds, id: \.self) { breed in
                                Text(breed).tag(breed)
                            }
                        }
                    }
                    Section(header: Text("นำ้หนัก (กิโลกรัม)")) {
                        TextField("นำ้หนัก (กิโลกรัม)", text: $weight)
                            .keyboardType(.decimalPad)
                    }
                }
                .navigationTitle("แก้ไขโปรไฟล์แมว")
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
        if let index = catProfiles.firstIndex(where: { $0.id == profile.id }) {
            catProfiles[index] = CatProfile(
                name: name,
                gender: gender,
                neutered: neutered,
                birthdate: birthdate,
                breed: breed,
                weight: weightDouble,
                profilePic: profilePic?.jpegData(compressionQuality: 0.8)
            )
        }
        presentationMode.wrappedValue.dismiss()
    }

}

struct CatProfileSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let catDataModel = CatDataModel()
        catDataModel.catProfiles = [
            CatProfile(name: "ฝุ่น", gender: "ผู้", neutered: true, birthdate: Date(), breed: "ไทย", weight: 4.5, profilePic: nil),
            CatProfile(name: "คอนโซล", gender: "เมีย", neutered: false, birthdate: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, breed: "ไทย", weight: 5.0, profilePic: nil)
        ]
        
        return CatProfileSelectionView(selectedCat: .constant(nil))
            .environmentObject(catDataModel)
    }
}
