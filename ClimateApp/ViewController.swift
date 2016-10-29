//
//  ViewController.swift
//  ClimateApp
//
//  Created by Sriteja Thuraka on 10/24/16.
//  Copyright © 2016 teja. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherType: UILabel!
    

    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
             self.updateUI()
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

