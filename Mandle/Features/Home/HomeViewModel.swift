//
//  HomeViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation

@Observable
class HomeViewModel {
    var path: [NavigationDestinaion] = []
    var isCameraOn = false
    var weather: WeatherDetail?
    
    func navigate(destination: NavigationDestinaion) {
        path.append(destination)
    }
    
    func requestRealtimeWeather() async {
        do {
            let weather = try await NetworkManager.shared.requestRealtimeWeather(
                latitude: 0,
                longitude: 0
            )
            self.weather = weather.data?.values
        } catch let error {
            print(error)
        }
    }
}
