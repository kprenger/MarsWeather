//
//  CurrentWeatherViewController.swift
//  MarsWeather
//
//  Created by K Prenger on 9/4/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    //MARK: - Variables
    
    var currentWeather: WeatherData? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateUI()
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingOverlay: UIView!
    
    @IBOutlet weak var atmosOpacityImageView: UIImageView!
    @IBOutlet weak var atmosOpacityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var solLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var windSpeedImageView: UIImageView!
    @IBOutlet weak var windSpeedLabel: UILabel!

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkUtility.getCurrentWeatherData { [weak self] weatherData in
            self?.currentWeather = weatherData
        }
    }
    
    //MARK: - UI Updates
    
    func updateUI() {
        defer {
            activityIndicator.stopAnimating()
        }
        
        guard let weatherData = currentWeather else {
            loadingLabel.text = "Houston, we have a problem."
            return
        }
        
        loadingOverlay.isHidden = true
        
        atmosOpacityLabel.text = weatherData.atmosphericOpacity.rawValue
        dateLabel.text = weatherData.earthDate.longDateString()
        highTempLabel.text = "\(weatherData.maxTempF) °F"
        lowTempLabel.text = "\(weatherData.minTempF) °F"
        solLabel.text = "Sol \(weatherData.marsDate)"
        sunriseTimeLabel.text = weatherData.sunriseDate.shortTimeString()
        sunsetTimeLabel.text = weatherData.sunsetDate.shortTimeString()
        windSpeedLabel.text = "\(weatherData.windSpeed) M/S"
    }

}