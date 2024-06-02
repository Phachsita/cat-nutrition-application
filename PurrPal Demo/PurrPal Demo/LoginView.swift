import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var isSignedIn = false
    @EnvironmentObject var catData: CatDataModel
    @Binding var selectedCat: CatProfile?

    var body: some View {
        NavigationView {
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
                
                // Sign in with Apple button
                SignInWithAppleButton(.signIn) { request in
                    // Configure your request here
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        // Handle successful sign-in
                        isSignedIn = true
                    case .failure(let error):
                        // Handle error
                        print("Sign in with Apple failed: \(error.localizedDescription)")
                    }
                }
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .cornerRadius(25)
                .padding(.horizontal, 50)
                
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
            NavigationLink(destination: CatProfileSelectionView(selectedCat: $selectedCat).environmentObject(catData), isActive: $isSignedIn) {
                EmptyView()
            }
            // Navigation link to the cat dashboard screen
            NavigationLink(destination: DashboardView(selectedCat: $selectedCat).environmentObject(catData), isActive: Binding(
                get: { selectedCat != nil },
                set: { _ in }
            )) {
                EmptyView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(selectedCat: .constant(nil)).environmentObject(CatDataModel())
    }
}
