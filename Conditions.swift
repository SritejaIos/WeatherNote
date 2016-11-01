//
//  Conditions.swift
//  ClimateApp
//
//  Created by Sriteja Thuraka on 10/27/16.
//  Copyright © 2016 teja. All rights reserved.
//

import UIKit

let bURL = "http://api.openweathermap.org/data/2.5/weather?"
let Lat = "lat="
let Lon = "&lon="
let appID = "&appid="
let appKey = "e6e4c4f1b2ab1ba2a87b0d344815dc2a"
typealias DownloadComplete = () -> ()
var Current_Weather_Url:String? = "\(bURL)\(Lat)30\(Lon)180\(appID)\(appKey)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=30&lon=180&cnt=10&mode=json&appid=e6e4c4f1b2ab1ba2a87b0d344815dc2a"
