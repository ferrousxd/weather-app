//
//  Constants.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import Foundation

struct Constants {
    
    static let host = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely,alerts&appid=0e9477e67e53c8c91844f7d87860ae02&units=metric"
    static let cities = [
        "Astana": Coordinates(latitude: "51.1801", longtitude: "71.446"),
        "Almaty": Coordinates(latitude: "43.25", longtitude: "76.95"),
        "Moscow": Coordinates(latitude: "55.7522", longtitude: "37.6156"),
        "Kyiv": Coordinates(latitude: "50.4333", longtitude: "30.5167"),
        "Minsk": Coordinates(latitude: "53.9", longtitude: "27.5667")
    ]
}

struct Coordinates: Equatable {
    
    let latitude: String
    let longtitude: String
}
