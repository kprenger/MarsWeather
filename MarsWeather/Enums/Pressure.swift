//
//  Pressure.swift
//  MarsWeather
//
//  Created by K Prenger on 9/4/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation

// Possible values for pressure were gathered from the data source's XML
// http://cab.inta-csic.es/rems/rems_weather.xml

extension Constants {
    struct PressureValues {
        static let higher = "Higher"
        static let lower = "Lower"
    }
}

enum Pressure: String {
    typealias values = Constants.PressureValues
    
    case average = "Average"
    case higher = "Higher"
    case lower = "Lower"
    
    init(value: String?) {
        guard let value = value else {
            self = .average
            return
        }
        
        switch value {
        case values.higher: self = .higher
        case values.lower: self = .lower
        default: self = .average
        }
    }
}
