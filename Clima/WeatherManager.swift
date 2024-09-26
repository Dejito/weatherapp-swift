//
//  WeatherManager.swift
//  Clima
//
//  Created by Oladeji Muhammed  on 9/25/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3b787c08a237c42ecde69cc62be6fbf2&units=metric"
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        //1. Create a url
        //2. Create a url session
        //3. Give the session a task
        //4. start the task
        
        //1.
        if let url = URL(string: urlString) {
            if urlString.isEmpty{
                return
            }
            //2.
            let session = URLSession(configuration: .default)
            //3.
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safetData = data {
                    let dataString = String(data: safetData, encoding: .utf8)
                    print(dataString)
                }
            }
            //4.
            task.resume()
            
        }
    }
    
 
    
}
