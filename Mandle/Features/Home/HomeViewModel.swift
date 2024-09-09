//
//  HomeViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation
import CoreLocation

@Observable
class HomeViewModel: NSObject {
    var path: [NavigationDestinaion] = []
    var isCameraOn = false
    var isLoading = false
    var weather: WeatherDetail?
    var location: CLLocationCoordinate2D?
    
    @ObservationIgnored var manager = CLLocationManager()
    
    func navigate(destination: NavigationDestinaion) {
        path.append(destination)
    }
    
    func requestRealtimeWeather(location: CLLocationCoordinate2D?) async {
        guard let location, weather == nil else {
            return
        }
        
        do {
            print("API CALL")
            
            let weather = try await NetworkManager.shared.requestRealtimeWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )
            self.weather = weather.data?.values
        } catch let error {
            print(error)
        }
    }
    
    func checkLocationAuthorization() {
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location restricted")
        case .denied:
            print("Location denied")
        case .authorizedAlways:
            print("Location authorizedAlways")
        case .authorizedWhenInUse:
            print("Location authorized when in use")
            self.location = manager.location?.coordinate
        @unknown default:
            print("Location service disabled")
        }
    }
}

extension HomeViewModel:  CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
    }
}
