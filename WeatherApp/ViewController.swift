//
//  ViewController.swift
//  WeatherApp
//
//  Created by Muhammet Yiğit on 12.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var textFieldLabel: UITextField!
    
    // MARK: - Properties
    let networkController = NetworkController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    // MARK: - Actions
    @IBAction func searchButton(_ sender: Any) {
        if let cityName = textFieldLabel.text {
            networkController.fetcWeather(cityName: cityName) { weather in
                DispatchQueue.main.async {
                    self.cityNameLabel.text = weather.cityName
                    self.temperatureLabel.text = String(weather.cityTemp)
                    self.logoImage.image = UIImage(systemName: weather.conditionName)
                }
            }
        }
    }
}

