//
//  ViewController.swift
//  rainyShinyCloudy
//
//  Created by Mostafa Oraei on 4/24/1396 AP.
//  Copyright © 1396 Mostafa Oraei. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var currentTempLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather : CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        currentWeather = CurrentWeather()
//        forecast = Forecast(weatherDict: <#Dictionary<String, AnyObject>#>)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
            self.updateUI()
            
            }
        }
    }
    
    func downloadForecastData(complited: @escaping DownloadComplete) {
        
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            print(response)
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                }
        
            }
            complited()
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
    
    func updateUI() {
        
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp)"
        locationLbl.text = currentWeather.cityName
        weatherImageView.image = UIImage(named: currentWeather.weatherType)
        weatherTypeLbl.text = currentWeather.weatherType
        
    }

}

