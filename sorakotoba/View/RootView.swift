import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var locationManager: LocationManager
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
        .task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            locationManager.requestPermission()
        }
    }
}
