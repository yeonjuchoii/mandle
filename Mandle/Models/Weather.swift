//
//  Weather.swift
//  Mandle
//
//  Created by 정지혁 on 9/9/24.
//

import Foundation

struct WeatherData: Codable {
    let data: Weather?
}

struct Weather: Codable {
    let time: String?
    let values: WeatherDetail?
}

struct WeatherDetail: Codable {
    let humidity: Int?
    let uvIndex: Int?
}
