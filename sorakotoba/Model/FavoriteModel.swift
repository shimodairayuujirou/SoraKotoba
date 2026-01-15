import Foundation
import FirebaseFirestore

struct Favorite: Identifiable {
    let id: String       // = postId
    let addedAt: Date

    init?(document: DocumentSnapshot) {
        let data = document.data()
        guard let addedAt = data?["addedAt"] as? Timestamp else { return nil }

        self.id = document.documentID
        self.addedAt = addedAt.dateValue()
    }
}

