//
//  weatherClass.swift
//  ClimateApp
//
//  Created by Sriteja Thuraka on 10/27/16.
//  Copyright © 2016 teja. All rights reserved.
//

import Foundation
import Alamofire

class weatherClass{
    
    var _cityName: String!
    var _date: String!
    var _weatherType:String!
    var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    var date: String {
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today\(currentDate)"
        return _date
    }
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double {
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
}
