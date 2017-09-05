//
//  NetworkUtility.swift
//  MarsWeather
//
//  Created by K Prenger on 9/1/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Alamofire
import Foundation

class NetworkUtility {
    
    private static let latestURL = URL(string: "http://marsweather.ingenology.com/v1/latest/")!
    private static let archiveURL = URL(string: "http://marsweather.ingenology.com/v1/archive/")!
    
    static func getCurrentWeatherData(completion: @escaping (WeatherData?) -> ()) {
        Alamofire.request(latestURL).responseJSON { response in
            guard response.result.isSuccess,
                let data = response.result.value as? [String : Any],
                let report = data["report"] as? [String : Any] else {
                    completion(nil)
                    return
            }
            
            completion(WeatherData(json: report))
        }
    }
    
    static func getArchiveWeatherData(completion: @escaping ([WeatherData]?) -> ()) {
        Alamofire.request(archiveURL).responseJSON { response in
            guard response.result.isSuccess,
                let data = response.result.value as? [String : Any],
                let results = data["results"] as? [[String : Any]] else { return }
            
            var weatherArray: [WeatherData] = []
            for weather in results {
                weatherArray.append(WeatherData(json: weather))
            }
            
            if weatherArray.count > 7 {
                weatherArray = Array(weatherArray[0...6])
            }
            
            completion(weatherArray)
        }
    }
    
}
