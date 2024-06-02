import SwiftUI
import Combine

class VaccineCardModel: ObservableObject {
    @Published var vaccineCards: [VaccineCard] = []
}
