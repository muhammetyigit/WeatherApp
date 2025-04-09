//
//  NetworkController.swift
//  WeatherApp
//
//  Created by Muhammet Yiğit on 12.03.2025.
//

import Foundation

class NetworkController {
    
    func getAPIKey() -> String? {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            return dict["API_KEY"] as? String
        }
        return nil
    }
    
    func fetcWeather(cityName: String, completion: @escaping (WeatherModel) -> Void) {
        
        guard let apiKey = getAPIKey() else { return }
        
        let cityUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&q=\(cityName)&units=metric")!
        let decoder = JSONDecoder()
        let weatherSession = URLSession(configuration: .default)
        let weatherTask = weatherSession.dataTask(with: cityUrl) { data, reponse, error in
            if let data = data {
                if let decodedData = try? decoder.decode(WeatherData.self, from: data) {
                    let weatherCity = decodedData.name
                    let weatherTemp = decodedData.main.temp
                    let weatherDescription = decodedData.weather[0].description
                    let weatherId = decodedData.weather[0].id
                    let weather = WeatherModel(cityName: weatherCity, cityTemp: weatherTemp, description: weatherDescription, conditionId: weatherId)
                    completion(weather)
                }
            }
        }
        weatherTask.resume()
    }
}
