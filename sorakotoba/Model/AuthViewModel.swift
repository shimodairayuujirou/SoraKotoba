import FirebaseAuth
import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @AppStorage("isAuthenticated") var isAuthenticated = false
    @Published var email = ""
    @Published var password = ""
    
    init() {
        checkAuthentication()
    }

    func checkAuthentication() {
        self.isAuthenticated = Auth.auth().currentUser != nil
    }
    
    func signInAnonymously() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("Anonymous login error: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.isAuthenticated = true
            }
        }
    }
}
