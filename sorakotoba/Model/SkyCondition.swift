//空詞用の天気モデル
import Foundation

enum SkyWeather: String {
    case clear = "晴れ"
    case cloudy = "くもり"
    case rain = "雨"
    case snow = "雪"
    case other = "その他"
}

enum TimeSlot: String {
    case morning = "朝"
    case daytime = "昼"
    case evening = "夕方"
    case night = "夜"
}

struct SkyCondition {
    let weather: SkyWeather
    let timeSlot: TimeSlot
}
