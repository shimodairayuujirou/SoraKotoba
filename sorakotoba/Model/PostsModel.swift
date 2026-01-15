import Foundation
import FirebaseFirestore

struct Post: Identifiable, Codable {
    let id: String
    let userId: String
    let text: String
    let weather: String
    let timeSlot: String
    let createdAt: Date

    init?(document: DocumentSnapshot) {
        let data = document.data()
        guard
            let userId = data?["userId"] as? String,
            let text = data?["text"] as? String,
            let weather = data?["weather"] as? String,
            let timeSlot = data?["timeSlot"] as? String,
            let createdAt = data?["createdAt"] as? Timestamp
        else { return nil }

        self.id = document.documentID
        self.userId = userId
        self.text = text
        self.weather = weather
        self.timeSlot = timeSlot
        self.createdAt = createdAt.dateValue()
    }
}
