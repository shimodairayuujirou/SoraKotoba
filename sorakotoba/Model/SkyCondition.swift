//空詞用の天気モデル
import Foundation

enum SkyWeather {
    case clear
    case cloudy
    case rain
    case snow
    case other
}

enum TimeSlot {
    case morning
    case daytime
    case evening
    case night
}

struct SkyCondition {
    let weather: SkyWeather
    let timeSlot: TimeSlot
}
