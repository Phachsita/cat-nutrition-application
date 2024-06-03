import SwiftUI
import Foundation

// Cat model
struct Cat: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var weight: Double
    var breed: String
    var profilePic: UIImage?
}


class CatDataModel: ObservableObject {
    @Published var catProfiles: [CatProfile] = []
}







//struct CatProfileRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CatProfileRow(profile: Cat(name: "Phun", age: 3, weight: 4.5, breed: "Siamese"), isSelected: true)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
