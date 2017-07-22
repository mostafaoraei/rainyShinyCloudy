//
//  constants.swift
//  rainyShinyCloudy
//
//  Created by Mostafa Oraei on 4/24/1396 AP.
//  Copyright © 1396 Mostafa Oraei. All rights reserved.
//

import Foundation

// http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=0c8288e2509a5895fa6a1dff39055e2e

let Base_URL = "http://api.openweathermap.org/data/2.5/weather?"
let Lantitude = "lat="
let Longtitude = "&lon="
let App_Id = "&appid="
let API_Key = "0c8288e2509a5895fa6a1dff39055e2e"

let current_Weather_URL = "\(Base_URL)\(Lantitude)50\(Longtitude)40\(App_Id)\(API_Key)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=50&lon=40&cnt=10&mode=json&appid=0c8288e2509a5895fa6a1dff39055e2e"

typealias DownloadComplete = () -> ()
