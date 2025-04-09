//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Muhammet Yiğit on 12.03.2025.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
