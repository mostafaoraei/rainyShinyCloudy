//
//  ViewController.swift
//  rainyShinyCloudy
//
//  Created by Mostafa Oraei on 4/24/1396 AP.
//  Copyright © 1396 Mostafa Oraei. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var currentTempLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather : CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetail {
            // Setup data to interface from JSON output
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateUI(){
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp)"
        print(currentWeather.currentTemp)
        locationLbl.text = currentWeather.cityName
        weatherImageView.image = UIImage(named: currentWeather.weatherType)
        weatherTypeLbl.text = currentWeather.weatherType
        print(currentWeather.weatherType)
        
    }

}

