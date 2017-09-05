//
//  HistoricalWeatherTableViewCell.swift
//  MarsWeather
//
//  Created by K Prenger on 9/5/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import UIKit

class HistoricalWeatherTableViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    var weather: WeatherData? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateUI()
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var atmosOpacityImageView: UIImageView!
    @IBOutlet weak var atmosOpacityLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var marsDateLabel: UILabel!
    @IBOutlet weak var moreDetailStack: UIStackView!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    //MARK: - UI Updates
    
    func updateUI() {
        guard let weatherData = weather else {
            return
        }
        
        atmosOpacityLabel.text = weatherData.atmosphericOpacity.rawValue
        highTempLabel.text = weatherData.getHighTempString()
        lowTempLabel.text = weatherData.getLowTempString()
        marsDateLabel.text = weatherData.getSolDateString()
        sunriseTimeLabel.text = weatherData.sunriseDate.shortTimeString()
        sunsetTimeLabel.text = weatherData.sunsetDate.shortTimeString()
        windDirectionLabel.text = weatherData.windDirection.rawValue
        windSpeedLabel.text = weatherData.getWindSpeedString()
    }
    
}
