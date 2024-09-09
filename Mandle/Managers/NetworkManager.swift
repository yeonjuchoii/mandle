//
//  NetworkManager.swift
//  Mandle
//
//  Created by 정지혁 on 9/9/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let apiKey = "nDdPkdTuSJrd75nUsPfWT0S6Xwb5S3MX"
    
    private init() {}
    
    func requestRealtimeWeather(latitude: Double, longitude: Double) async throws -> WeatherData {
        guard let url = URL(string: "https://api.tomorrow.io/v4/weather/realtime"),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return WeatherData(data: nil)
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "apikey", value: "nDdPkdTuSJrd75nUsPfWT0S6Xwb5S3MX"),
            URLQueryItem(name: "location", value: "toronto")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["accept": "application/json"]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print(String(decoding: data, as: UTF8.self))
        let weather = try JSONDecoder().decode(WeatherData.self, from: data)
        return weather
    }
}
