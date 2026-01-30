import SwiftUI

struct IntroIntroductionView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        VStack {
            Text("空詞へようこそ")
                .font(.largeTitle)
                .padding()

            Button("はじめる") {
                authViewModel.signInAnonymously()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#D1E4FF").ignoresSafeArea())
    }
}
