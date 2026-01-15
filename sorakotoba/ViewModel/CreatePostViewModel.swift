import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

final class CreatePostViewModel: ObservableObject {    

    @Published var text: String = ""
    @Published var isPosting = false
    @Published var errorMessage: String?

    private let db = Firestore.firestore()

    func createPost(weather: String, timeSlot: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        isPosting = true

        let data: [String: Any] = [
            "userId": uid,
            "text": text,
            "weather": weather,
            "timeSlot": timeSlot,
            "createdAt": Timestamp()
        ]

        db.collection("posts").addDocument(data: data) { error in
            DispatchQueue.main.async {
                self.isPosting = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.text = ""
                }
            }
        }
    }
}
