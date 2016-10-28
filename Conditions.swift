//
//  Conditions.swift
//  ClimateApp
//
//  Created by Sriteja Thuraka on 10/27/16.
//  Copyright © 2016 teja. All rights reserved.
//

import Foundation

let bURL = "http://api.openweathermap.org/data/2.5/weather?"
let Lat = "lat="
let Lon = "&lon="
let appID = "&appid="
let appKey = "e6e4c4f1b2ab1ba2a87b0d344815dc2a"
typealias DownloadComplete = () -> ()
var Current_Weather_Url:String? = "\(bURL)\(Lat)30\(Lon)180\(appID)\(appKey)"
