//
//  Location.swift
//  rainyShinyCloudy
//
//  Created by Mostafa Oraei on 5/1/1396 AP.
//  Copyright © 1396 Mostafa Oraei. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
