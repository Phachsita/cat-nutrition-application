import SwiftUI

struct LoginView: View {
    @State private var selectedCat: CatProfile?
        @State private var isNavigating = false

        var body: some View {
            NavigationView {
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: CatProfileSelectionView()){
                        Button(action: {
                            isNavigating = true
                        }) {
                            Text("Go to InitialView")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
                        .background()
                    }
                }
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

