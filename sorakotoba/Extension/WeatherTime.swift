extension SkyCondition {

    var weatherText: String {
        switch weather {
        case .clear: return "晴れ"
        case .cloudy: return "くもり"
        case .rain: return "雨"
        case .snow: return "雪"
        case .other: return "不明"
        }
    }

    var timeSlotText: String {
        switch timeSlot {
        case .morning: return "朝"
        case .daytime: return "昼"
        case .evening: return "夕方"
        case .night: return "夜"
        }
    }
}
