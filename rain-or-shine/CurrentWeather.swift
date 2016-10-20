//
//  CurrentWeather.swift
//  rain-or-shine
//
//  Created by Jason Ngo on 2016-10-19.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = currentDate
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                // City Name
                if let cityName = dict["name"] as? String {
                    self._cityName = cityName
                    print(self.cityName)
                }
                
                // Weather Type
                if let weatherDict = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let weatherType = weatherDict[0]["main"] as? String {
                        self._weatherType = weatherType
                        print(self.weatherType)
                    }
                }
                
                // Current Temp
                if let mainDict = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = mainDict["temp"] as? Double {
                        self._currentTemp = currentTemp - CELSIUS_CONSTANT
                        print(self.currentTemp)
                    }
                    
                }
                
            }
            completed()
        }
    }
    
}
