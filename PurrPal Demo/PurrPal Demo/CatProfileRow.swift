import SwiftUI

struct CatProfileRow: View {
    var profile: CatProfile

    var body: some View {
        HStack {
            if let profilePic = profile.profilePic, let uiImage = UIImage(data: profilePic) {
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
                Text("Age: \(profile.age) years")
                Text("Breed: \(profile.breed)")
                Text("Weight: \(profile.weight, specifier: "%.1f") kg")
            }
        }
    }
}
