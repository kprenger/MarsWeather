//
//  DateExtension.swift
//  MarsWeather
//
//  Created by K Prenger on 9/4/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import Foundation

extension Date {
    
    /// Takes a year/month/day string and converts it into a `Date`
    ///
    /// - Parameter dateString: the date in the format "yyyy-MM-dd"
    /// - Returns: a `Date` representing the given string
    static func dateFromYMDString(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: dateString)
    }
    
    /// Takes an ISO8601 date string and converts it into a `Date`
    ///
    /// - Parameter dateString: the date in the ISO8601 format "yyyy-MM-ddThh:mm:ssZ"
    /// - Returns: a `Date` representing the given string
    static func dateFromISO8601String(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: dateString)
    }
    
    /// Creates a date string for a given `Date`
    ///
    /// - Returns: the date in the `.long` date style format
    func longDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        return dateFormatter.string(from: self)
    }
    
    /// Creates a time string for a given `Date`
    ///
    /// - Returns: the time in the `.short` date style format
    func shortTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: self)
    }
}
