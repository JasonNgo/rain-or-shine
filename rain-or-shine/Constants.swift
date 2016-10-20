//
//  Constants.swift
//  rain-or-shine
//
//  Created by Jason Ngo on 2016-10-19.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER = "weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

let FORECAST = "forecast/daily?"
let CNT = "&cnt=10"
let MODE = "&mode=json"

let API_KEY = "ddb7d906b1618250b1311e20360f6fa8"

let CELSIUS_CONSTANT = 273.15

typealias DownloadComplete = () -> ()

// Need to include x and y coordinates
let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)35\(LONGITUDE)139\(CNT)\(MODE)\(APP_ID)\(API_KEY)"
