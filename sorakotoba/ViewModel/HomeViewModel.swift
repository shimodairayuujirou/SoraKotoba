import Foundation
import Combine
import FirebaseFirestore

class HomeViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var skyCondition: SkyCondition?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var randomPost: Post?

    private let db = Firestore.firestore()
    private let api = API.shared

    @MainActor
    func fetchMatchedRandomPost() async {
        guard let condition = skyCondition else { return }

        do {
            let snapshot = try await db.collection("posts")
                .whereField("weather", isEqualTo: condition.weather.rawValue)
                .whereField("timeSlot", isEqualTo: condition.timeSlot.rawValue)
                .getDocuments()

            let posts = snapshot.documents.compactMap { doc in
                Post(document: doc)
            }

            self.randomPost = posts.randomElement()

        } catch {
            print("🔥 Firestore error:", error)
        }
    }
    
    func fetchWeather(
        lat: Double,
        lon: Double
    ) {
        isLoading = true

        Task {
            do {
                let condition = try await api.fetchSkyCondition(
                    lat: lat,
                    lon: lon
                )

                await MainActor.run {
                    self.skyCondition = condition
                }
                //ここで初めて呼ぶ
                await fetchMatchedRandomPost()

            } catch {
                await MainActor.run {
                    self.errorMessage = "天気情報の取得に失敗しました"
                }
            }

            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}
