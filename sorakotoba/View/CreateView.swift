import SwiftUI

struct CreateView: View {

    @StateObject private var viewModel = CreatePostViewModel()
    @Environment(\.dismiss) private var dismiss

    let currentWeather = "晴れ"
    let currentTimeSlot = "夕方"

    var body: some View {
        VStack(spacing: 24) {

            // 天気表示
            VStack(spacing: 4) {
                Text(currentWeather)
                    .font(.title2)
                    .bold()

                Text(currentTimeSlot)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // 入力エリア
            TextEditor(text: $viewModel.text)
                .padding(12)
                .frame(height: 160)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                .overlay(
                    Text(viewModel.text.isEmpty ? "今の空に対する気持ちは..." : "")
                        .foregroundColor(.gray)
                        .padding(.leading, 16)
                        .padding(.top, 12),
                    alignment: .topLeading
                )
            // 投稿ボタン
            Button {
                viewModel.createPost(
                    weather: currentWeather,
                    timeSlot: currentTimeSlot
                )
                dismiss()
            } label: {
                Text("空に添える")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.text.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(viewModel.text.isEmpty || viewModel.isPosting)

            Spacer()
        }
        .padding()
        .navigationTitle("ことばを添える")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#D1E4FF").ignoresSafeArea())
    }
}
