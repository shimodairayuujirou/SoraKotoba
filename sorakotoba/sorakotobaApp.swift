import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct sorakotobaApp: App {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject private var locationManager = LocationManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
          RootView()
              .environmentObject(locationManager)
              .environmentObject(authViewModel)
      }
    }
  }
}
