import SwiftUI
internal import _LocationEssentials

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack (spacing: 20) {
            HStack{
                Spacer()
                Button(action: {print("メニューボタンが押されました")}) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 25))
                        .foregroundStyle(Color(hex: "000000"))
                }
            }
            Spacer()
            if let location = locationManager.location {
                Text("lat: \(location.coordinate.latitude)")
                Text("lon: \(location.coordinate.longitude)")
            } else {
                Text("位置情報が取得できませんでした")
            }
            if let condition = viewModel.skyCondition {
                Text(condition.weatherText)
                Text(condition.timeSlotText)
            } else if viewModel.isLoading {
                Text("天気取得中…")
            }

            if let post = viewModel.randomPost {
                Text(post.text)
            } else {
                Text("今の空に合う言葉を共有してみませんか")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            HStack{
                Spacer()
                Button(action: {print("お気に入り")}) {
                    Image(systemName: "star")
                        .font(.system(size: 35))
                        .foregroundStyle(Color(hex: "000000"))
                }
            }
            HStack (alignment: .bottom) {
                Spacer()
                Spacer()
                Button(action: {
                    print("天気詳細")
                }) {
                    Text("天気詳細を見る")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 20)
                        .background(
                            ZStack {
                                // 外側レイヤー（ぼかし）
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.black.opacity(0.4))
                                    .blur(radius: 8)
                                
                                // 内側レイヤー（輪郭が残る部分）
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.black.opacity(0.4))
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 24)) // 全体の輪郭を維持
                }
                
                Spacer()
                if let condition = viewModel.skyCondition {
                    NavigationLink(
                        destination: CreateView(skyCondition: condition)
                    ) {
                        PlusButton()
                    }
                }
            }
        }
        .onChange(of: locationManager.location) { location in
            guard let location else { return }

            viewModel.fetchWeather(
                lat: location.coordinate.latitude,
                lon: location.coordinate.longitude
            )
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#D1E4FF").ignoresSafeArea())
    }
}
