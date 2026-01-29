//位置情報取得
import CoreLocation
import Combine

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        print("LocationManager init:", ObjectIdentifier(self))
    }
    
    func requestPermission() {
        DispatchQueue.main.async {
            self.manager.requestWhenInUseAuthorization()
            print(Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") ?? "nil")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            print("位置情報が拒否されています")
        case .notDetermined:
            print("未決定")
            print("現在:", manager.authorizationStatus.rawValue)
        @unknown default:
            break
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.first
        print("取得成功:", location!)
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Location error:", error)
    }
}

