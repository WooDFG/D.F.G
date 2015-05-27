//
//  WeatherService.swift
//  ClearStyle
//
//  Created by WengVic on 2015/5/27.
//  Copyright (c) 2015年 A30607. All rights reserved.
//

import Foundation

public class WeatherService {
    public typealias WeatherDataCompletionBlock = (data: WeatherData?, error: NSError?) -> ()
    
    let openWeatherBaseAPI = "http://api.openweathermap.org/data/2.5/weather?units=metric&q="
    let urlSession:NSURLSession = NSURLSession.sharedSession()
    
    public class func sharedWeatherService() -> WeatherService {
        return _sharedWeatherService
    }
    
    public func getCurrentWeather(location:String, completion: WeatherDataCompletionBlock) {
        let openWeatherAPI = openWeatherBaseAPI + location.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        let request = NSURLRequest(URL: NSURL(string: openWeatherAPI)!)
        var weatherData = WeatherData()
        
        let task = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
                completion(data: nil, error: error)
            }
            
            // Retrieve JSON data
            var jsonError:NSError?
            let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary
            
            if jsonError != nil {
                println(jsonError?.localizedDescription)
                completion(data: nil, error: jsonError)
            }
            
            // Parse JSON data
            let jsonWeather = jsonResult?["weather"] as! [AnyObject]
            
            for jsonCurrentWeather in jsonWeather {
                weatherData.weather = jsonCurrentWeather["description"] as! String
            }
            
            let jsonMain = jsonResult?["main"] as! Dictionary<String, AnyObject>
            weatherData.temperature = jsonMain["temp"] as! Int
            
            completion(data: weatherData, error: error)
        })
        
        task.resume()
    }
    
}

let _sharedWeatherService: WeatherService = { WeatherService() }()