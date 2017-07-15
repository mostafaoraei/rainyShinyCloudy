//
//  constants.swift
//  rainyShinyCloudy
//
//  Created by Mostafa Oraei on 4/24/1396 AP.
//  Copyright © 1396 Mostafa Oraei. All rights reserved.
//

import Foundation

let Base_URL = "api.openweathermap.org/data/2.5/weather?"
let Lantitude = "lat="
let Longtitude = "&lon="
let App_Id = "&appid"
let API_Key = "0c8288e2509a5895fa6a1dff39055e2e"

let current_Weather_URL = "\(Base_URL)\(Lantitude)40\(Longtitude)-40\(App_Id)\(API_Key)"

typealias DownloadCompleted = () -> ()
