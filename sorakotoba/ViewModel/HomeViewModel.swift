import Foundation
import Combine
import FirebaseFirestore

class HomeViewModel: ObservableObject {

    @Published var posts: [Post] = []

    private let db = Firestore.firestore()

    func fetchPosts() {
        db.collection("posts")
            .order(by: "createdAt", descending: true)
            .limit(to: 20)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else { return }

                self.posts = documents.compactMap {
                    try? $0.data(as: Post.self)
                }
            }
    }
}
