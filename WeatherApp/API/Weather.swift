//
//  Weather.swift
//  WeatherApp
//
//  Created by lakeem muhammad on 1/20/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation

//TODO: update with new weather api
// new key 6eadc0006d26a8c87a586e5fd0a56b0e
// http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}

// example api.openweathermap.org/data/2.5/forecast?id=524901&APPID=1111111111

class Weather: Codable {
    
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastText: ForecastText
    
    private enum CodingKeys : String, CodingKey{
        case forecastText = "txt_forecast"
    }
}

struct ForecastText: Codable {
    let date: String
    let forecastDays: [ForecastDay]
    
    private enum CodingKeys : String, CodingKey{
        case date = "txt_forecast"
        case forecastDays = "forecastday"
        
    }
}

struct  ForecastDay: Codable {
    let iconURL : URL
    let day : String
    let description : String
    
    private enum CodingKeys : String, CodingKey{
        case iconURL = "icon_url"
        case day = "title"
        case description = "fcttext"
        
    }
}
