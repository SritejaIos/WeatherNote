//
//  ViewController.swift
//  ClimateApp
//
//  Created by Sriteja Thuraka on 10/24/16.
//  Copyright © 2016 teja. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherType: UILabel!
    
    
    var currentWeather = CurrentWeather()
    var weatherforecast = weatherForecast!.self
    var forecasts = [weatherForecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateUI()
            }
            
        }
        }
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
      //downloading weather data in table view
        let foreCastURL = URL(string: FORECAST_URL)!
        Alamofire.request(foreCastURL).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list{
                        let weatherforecast = weatherForecast(weatherDict: obj)
                        self.forecasts.append(weatherforecast)
                        print(obj)
                    }
                }
                
            }
            completed()
        }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "climateCell", for: indexPath)
        return cell
    }
    
    func updateUI(){
        
      cityLabel.text = currentWeather.cityName
       tempLabel.text = "\(currentWeather.currentTemp)\("°")"
        weatherType.text = currentWeather.weatherType
        dateLabel.text = currentWeather.date
        weatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

   

}

