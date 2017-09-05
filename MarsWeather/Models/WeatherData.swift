//
//  WeatherData.swift
//  MarsWeather
//
//  Created by K Prenger on 9/1/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation

extension Constants {
    struct WeatherDataKeys {
        static let atmosphericOpacity = "atmo_opacity"
        static let earthDate = "terrestrial_date"
        static let humidity = "abs_humidity"
        static let marsDate = "sol"
        static let maxTempC = "max_temp"
        static let maxTempF = "max_temp_fahrenheit"
        static let minTempC = "min_temp"
        static let minTempF = "min_temp_fahrenheit"
        static let pressure = "pressure"
        static let pressureString = "pressure_string"
        static let season = "season"
        static let solarLongitude = "ls"
        static let sunriseDate = "sunrise"
        static let sunsetDate = "sunset"
        static let windDirection = "wind_direction"
        static let windSpeed = "wind_speed"
    }
}

struct WeatherData {
    typealias keys = Constants.WeatherDataKeys
    
    //After looking at the API, it appears that most of these values are guaranteed, so I've
    //left them as non-nullable. However, if that ends up crashing things, I will need to
    //re-evaluate my approach.
    let atmosphericOpacity: AtmosphericOpacity
    let earthDate: Date
    let humidity: Float?
    let marsDate: Int
    let maxTempC: Float
    let maxTempF: Float
    let minTempC: Float
    let minTempF: Float
    let pressure: Float
    let pressureString: Pressure
    let season: String
    let solarLongitude: Float
    let sunriseDate: Date
    let sunsetDate: Date
    let windDirection: WindDirection
    let windSpeed: Float?
    
    init(json: [String : Any]) {
        atmosphericOpacity = AtmosphericOpacity(value: json[keys.atmosphericOpacity] as? String)
        earthDate = Date.dateFromYMDString(json[keys.earthDate] as? String) ?? Date()
        humidity = json[keys.humidity] as? Float
        marsDate = json[keys.marsDate] as! Int
        maxTempC = json[keys.maxTempC] as! Float
        maxTempF = json[keys.maxTempF] as! Float
        minTempC = json[keys.minTempC] as! Float
        minTempF = json[keys.minTempF] as! Float
        pressure = json[keys.pressure] as! Float
        pressureString = Pressure(value: json[keys.pressureString] as? String)
        season = json[keys.season] as! String
        solarLongitude = json[keys.solarLongitude] as! Float
        sunriseDate = Date.dateFromISO8601String(json[keys.sunriseDate] as? String) ?? Date()
        sunsetDate = Date.dateFromISO8601String(json[keys.sunsetDate] as? String) ?? Date()
        windDirection = WindDirection(value: json[keys.windDirection] as? String)
        windSpeed = json[keys.windSpeed] as? Float
    }
}
