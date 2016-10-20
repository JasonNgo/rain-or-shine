//
//  Forecast.swift
//  rain-or-shine
//
//  Created by Jason Ngo on 2016-10-20.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherData: Dictionary<String, AnyObject>) {
        
        if let tempDict = weatherData["temp"] as? Dictionary<String, AnyObject> {
            if let min = tempDict["min"] as? Double {
                let lowTempString = (min - CELSIUS_CONSTANT).format(f: ".2")
                self._lowTemp = lowTempString
            }
            
            if let max = tempDict["max"] as? Double {
                let highTempString = (max - CELSIUS_CONSTANT).format(f: ".2")
                self._highTemp = highTempString
            }
        }
        
        if let weatherDict = weatherData["weather"] as? [Dictionary<String, AnyObject>] {
            if let weatherType = weatherDict[0]["main"] as? String {
                self._weatherType = weatherType
            }
        }
        
        if let date = weatherData["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
