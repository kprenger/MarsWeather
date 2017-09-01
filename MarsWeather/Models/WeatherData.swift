//
//  WeatherData.swift
//  MarsWeather
//
//  Created by K Prenger on 9/1/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation

// Possible values for `String` types were gathered from the data source's XML
// http://cab.inta-csic.es/rems/rems_weather.xml

struct WeatherData {
    //Cloudy, Dust_devils_and_strong_winds, Fog, Frost, Ice_and_fog, Snow, Storm, Sunny_and_cloudy, Sunny, Windy
    let atomsphericOpacity: String
    let earthDate: Date
    let humidity: Float?
    let marsDate: Int
    let maxTempC: Float
    let maxTempF: Float
    let minTempC: Float
    let minTempF: Float
    let pressure: Float
    
    //Higher, Lower - relative to average pressure
    let pressureString: String
    
    //Of the format "Month n"
    let season: String
    let solarLongitude: Float
    let sunriseDate: Date
    let sunsetDate: Date
    
    //--, N, NE, E, SE, S, SW, W, NW
    let windDirection: String
    let windSpeed: Float?
}
