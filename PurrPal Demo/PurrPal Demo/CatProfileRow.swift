import SwiftUI

struct CatProfileRow: View {
    let profile: CatProfile

    var body: some View {
        HStack {
            if let profilePicData = profile.profilePic, let uiImage = UIImage(data: profilePicData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
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
