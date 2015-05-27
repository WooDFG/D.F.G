//
//  TodayViewController.swift
//  Weather Widget
//
//  Created by WengVic on 2015/5/27.
//  Copyright (c) 2015年 A30607. All rights reserved.
//

import UIKit
import NotificationCenter
import WeatherInfoKit

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    var location = "Paris,France"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //呼叫天氣服務以獲取天氣資料
        
        WeatherService.sharedWeatherService().getCurrentWeather(location, completion: { (data, error) -> () in
            dispatch_async(dispatch_get_main_queue(), {
                if let weatherData = data {
                self.weatherLabel.text = weatherData.weather.capitalizedString
                self.temperatureLabel.text = String(format: "%d",weatherData.temperature) + "\u{00B0}"
                }
            })
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
//        if let defaultLocation = defaults.valueForKey("location") as? String {
//            location = defaultLocation
//        }
        
        cityLabel.text = location
        
        // Invoke weather service to get the weather data
        WeatherService.sharedWeatherService().getCurrentWeather(location, completion: { (data, error) -> () in
            
            if (error == nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    if let weatherData = data {
                        self.weatherLabel.text = weatherData.weather.capitalizedString
                        self.temperatureLabel.text = String(format: "%d", weatherData.temperature) + "\u{00B0}"
                    }
                })
                completionHandler(NCUpdateResult.NewData)
            } else {
                completionHandler(NCUpdateResult.NoData)
            }
        })
        
        
    }
    
}
