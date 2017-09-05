//
//  AtmosphericOpacity.swift
//  MarsWeather
//
//  Created by K Prenger on 9/4/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation
import UIKit

// Possible values for atmospheric opacity were gathered from the data source's XML
// http://cab.inta-csic.es/rems/rems_weather.xml

extension Constants {
    struct AtmosphericOpacityValues {
        static let cloudy = "Cloudy"
        static let dustDevilsAndStrongWinds = "Dust_devils_and_strong_winds"
        static let fog = "Fog"
        static let frost = "Frost"
        static let iceAndFog = "Ice_and_fog"
        static let snow = "Snow"
        static let storm = "Storm"
        static let sunnyAndCloudy = "Sunny_and_cloudy"
        static let sunny = "Sunny"
        static let windy = "Windy"
    }
}

enum AtmosphericOpacity: String {
    typealias values = Constants.AtmosphericOpacityValues
    
    case cloudy = "Cloudy"
    case dustDevilsAndStrongWinds = "Dust Storms"
    case fog = "Fog"
    case frost = "Frost"
    case iceAndFog = "Ice and Fog"
    case snow = "Snow"
    case storm = "Storm"
    case sunnyAndCloudy = "Partial Sun"
    case sunny = "Sunny"
    case windy = "Windy"
    
    case unknown = "Unknown"
    
    init(value: String?) {
        guard let value = value else {
            self = .unknown
            return
        }
        
        switch value {
        case values.cloudy: self = .cloudy
        case values.dustDevilsAndStrongWinds: self = .dustDevilsAndStrongWinds
        case values.fog: self = .fog
        case values.frost: self = .frost
        case values.iceAndFog: self = .iceAndFog
        case values.snow: self = .snow
        case values.storm: self = .storm
        case values.sunnyAndCloudy: self = .sunnyAndCloudy
        case values.sunny: self = .sunny
        case values.windy: self = .windy
        default: self = .unknown
        }
    }
    
    func image() -> UIImage {
        switch self {
        case .sunny: return #imageLiteral(resourceName: "Sunny")
        default: return #imageLiteral(resourceName: "Sunny")
        }
    }
}
