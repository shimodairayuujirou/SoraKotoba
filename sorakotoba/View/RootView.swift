import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @AppStorage("isAuthenticated") var isAuthenticated = false
    var body: some View {
        Group{
            if authViewModel.isAuthenticated {
                NavigationStack {
                    TabBarView()
                }
            } else {
                IntroIntroductionView()
            }
        }
    }
}
