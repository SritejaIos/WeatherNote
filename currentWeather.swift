    //
    //  currentWeather.swift
    //  ClimateApp
    //
    //  Created by Sriteja Thuraka on 10/27/16.
    //  Copyright © 2016 teja. All rights reserved.
    //



    import UIKit
    import Alamofire

    class CurrentWeather{
        
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
        func downloadWeatherDetails(completed:@escaping DownloadComplete){
            if let currentWeatherRul = Current_Weather_Url{
                Alamofire.request(currentWeatherRul).responseJSON{ response in
                    
                    let result = response.result
                    if let dictn = result.value as? Dictionary<String, AnyObject>{
                        if let name = dictn["name"] as? String{
                            self._cityName = name.capitalized
                            print(self._cityName)
                        }
                        
                        
                        if let weather = dictn["weather"] as? [Dictionary<String, AnyObject>]{
                            
                            if let main = weather[0]["main"] as? String{
                                self._weatherType = main.capitalized
                                print(self._weatherType)
                            }
                        }
                        if let main = dictn["main"] as? Dictionary<String, AnyObject>{
                            if let  currentTemperature = main["temp"] as? Double{
                                let kelvinToFarenhitPre = (currentTemperature * (9/5)-459.67)
                                let KelvinToFarenhit = Double(round(10*kelvinToFarenhitPre/10))
                                self._currentTemp = KelvinToFarenhit
                                print(self._currentTemp)
                            }
                        }
                    }
                    
                    completed()

                }
            
            }
            
            
            
        }
        
        
    }

