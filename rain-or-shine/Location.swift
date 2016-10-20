//
//  Location.swift
//  rain-or-shine
//
//  Created by Jason Ngo on 2016-10-20.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
