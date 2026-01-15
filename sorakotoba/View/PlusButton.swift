import SwiftUI

struct PlusButton: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(.white)
            .padding(15)
            .background(
                ZStack {
                    Circle().fill(Color.black.opacity(0.2)).blur(radius: 8)
                    Circle().fill(Color.black.opacity(0.2))
                }
            )
            .clipShape(Circle())
    }
}

