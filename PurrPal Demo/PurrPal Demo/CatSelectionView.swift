import SwiftUI

struct CatProfileSelectionView: View {
    @EnvironmentObject var catData: CatDataModel
    @Binding var selectedCat: CatProfile?
    @State private var showingAddCatProfileView = false

    var body: some View {
        NavigationView {
            VStack {
                if catData.catProfiles.isEmpty {
                    Text("No cat profiles available. Please create one.")
                        .padding()
                } else {
                    List(catData.catProfiles) { profile in
                        HStack {
                            CatProfileRow(profile: profile)
                            Spacer()
                            Button(action: {
                                selectedCat = profile
                            }) {
                                Image(systemName: "checkmark.circle")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                Spacer()
                Button(action: {
                    showingAddCatProfileView = true
                }) {
                    Text("เพิ่มแมว")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("เลือกแมว")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingAddCatProfileView) {
                AddCatProfileView(catProfiles: $catData.catProfiles)
            }
        }
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
