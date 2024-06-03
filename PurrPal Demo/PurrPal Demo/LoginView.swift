import SwiftUI

struct LoginView: View {
    @Binding var selectedCat: CatProfile?
    @EnvironmentObject var catData: CatDataModel

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // App logo or title
            Text("PurrPal")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 20)
            
            // Custom logo image
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.bottom, 40)
            
            // Simulated Sign in with Apple button
            Button(action: {
                // Simulate successful sign-in by setting selectedCat to trigger navigation
                selectedCat = nil // Ensure it navigates to the CatProfileSelectionView
            }) {
                HStack {
                    Image(systemName: "applelogo")
                        .font(.title2)
                    Text("Sign in with Apple")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.horizontal, 50)
            }
            
            Spacer()
            
            // Footer text
            Text("By continuing, you agree to our Terms and Privacy Policy")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .navigationBarHidden(true)
        
        // Navigation link to the cat selection screen
        NavigationLink(destination: InitialView(selectedCat: $selectedCat).environmentObject(catData), isActive: Binding(
            get: { selectedCat == nil },
            set: { _ in }
        )) {
            EmptyView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(selectedCat: .constant(nil)).environmentObject(CatDataModel())
    }
}
