//
//  Endpoint.swift
//  WeatherApp
//
//  Created by lakeem muhammad on 1/20/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation


protocol Endpoint {
    var baseURL : String {get}
    var path : String {get}
    var queryItems: [URLQueryItem ] {get}
}

extension Endpoint {
    var urlComponents: URLComponents{
        var component = URLComponents(string: baseURL)
        component?.path = path
        component?.queryItems = queryItems
        return component!
    }
    var request:  URLRequest{
         return URLRequest(url: urlComponents.url!)
    }
    
}

//TODO: update with new weather api
// new key 6eadc0006d26a8c87a586e5fd0a56b0e
// http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}

// example api.openweathermap.org/data/2.5/forecast?id=524901&APPID=1111111111

enum WeatherEndpoint: Endpoint {
    case tenDayForecast(city: String, state: String)
    var baseURL: String {
        return APIConstents.weatherAPIEndpointUrl //TODO: Update weather API
        
    }  //get new API URL
    
    var path: String {
        switch self {
        case .tenDayForecast(let city, let state):
            return "" //TODO: Find a new weather api
            
        }
    }
    
    //unsed for now
    var queryItems: [URLQueryItem] {
        return []
    }
    
}


//api.openweathermap.org/data/2.5/forecast?id=4192205&APPID=6eadc0006d26a8c87a586e5fd0a56b0e

private enum  APIConstents {
    
    static let weatherAPIEndpointUrl = "http://api.openweathermap.org"
    static let weatherAPIKey = "6eadc0006d26a8c87a586e5fd0a56b0e"
}
