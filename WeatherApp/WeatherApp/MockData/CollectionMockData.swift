//
//  CollectionMockData.swift
//  WeatherApp
//
//  Created by Vitaly on 27.06.2024.
//

import UIKit

struct MockData {
    static let shared = MockData()
    
    private var today: ListSections = {
        .todays([.init(time: "12:00", image: "cloudRainImage", city: "", forecast: "", temp: "35" + "°"),
                 .init(time: "15:00", image: "rainyWeatherImage", city: "", forecast: "", temp: "31" + "°"),
                 .init(time: "18:00", image: "cloudRainImage", city: "", forecast: "", temp:  "29" + "°"),
                 .init(time: "21:00", image: "rainyWeatherImage", city: "", forecast: "", temp: "25" + "°"),
                 .init(time: "24:00", image: "cloudRainImage", city: "", forecast: "", temp: "30" + "°"),
                 .init(time: "03:00", image: "rainImage", city: "", forecast: "", temp: "20" + "°"),
                 .init(time: "06:00", image: "cloudyImage", city: "", forecast: "", temp: "24" + "°"),
                 .init(time: "09:00", image: "sunny", city: "", forecast: "", temp: "27" + "°"),
                 .init(time: "12:00", image: "sunny", city: "", forecast: "", temp: "33" + "°"),
                 .init(time: "15:00", image: "cloudRainImage", city: "", forecast: "", temp: "35" + "°"),
                 .init(time: "18:00", image: "cloudRainImage", city: "", forecast: "", temp: "32" + "°"),
                 .init(time: "21:00", image: "rainImage", city: "", forecast: "", temp: "27" + "°"),
                 .init(time: "24:00", image: "cloudRainImage", city: "", forecast: "", temp: "24" + "°"),])
    }()
    
    private var city: ListSections = {
        .cities([.init(time: "", image:  "sunny", city:  "Moscow", forecast: "Sunny", temp: "25" + "°"),
                 .init(time: "", image:  "cloudRainImage", city:  "London", forecast: "Rainy", temp: "24" + "°"),
                 .init(time: "", image:  "sunny", city:  "Canberra", forecast: "Sunny", temp: "37" + "°"),
                 .init(time: "", image:  "rainImage", city:  "Los Angeles", forecast: "Rainy", temp: "20" + "°"),
                 .init(time: "", image:  "cloudyImage", city:  "Tokyo", forecast: "Сloudy", temp: "25" + "°")])
    }()
    
    var pageData: [ListSections] {
        [today, city]
    }
}
