//
//  WindDirection.swift
//  MarsWeather
//
//  Created by K Prenger on 9/4/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation

// Possible values for wind direction were gathered from the data source's XML
// http://cab.inta-csic.es/rems/rems_weather.xml

//--, N, NE, E, SE, S, SW, W, NW

extension Constants {
    struct WindDirectionValues {
        static let east = "E"
        static let none = "--"
        static let north = "N"
        static let northEast = "NE"
        static let northWest = "NW"
        static let south = "S"
        static let southEast = "SE"
        static let southWest = "SW"
        static let west = "W"
    }
}

enum WindDirection: String {
    typealias values = Constants.WindDirectionValues
    
    case east
    case none
    case north
    case northEast
    case northWest
    case south
    case southEast
    case southWest
    case west
    
    init(value: String?) {
        guard let value = value else {
            self = .none
            return
        }
        
        switch value {
        case values.east: self = .east
        case values.north: self = .north
        case values.northEast: self = .northEast
        case values.northWest: self = .northWest
        case values.south: self = .south
        case values.southEast: self = .southEast
        case values.southWest: self = .southWest
        default: self = .none
        }
    }
}
