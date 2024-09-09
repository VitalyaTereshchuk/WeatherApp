//
//  ResultCityWeekViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 28.08.2024.
//

import Foundation

struct ResultCityWeekViewModel {
    let day: String
    let image: String
    let forecast: String
    let tempMax: String
    let tempMin: String
    
    init(items: SearchCityTableResultModel) {
        day = items.day
        image = items.image
        forecast = items.forecast
        tempMax = items.tempMax
        tempMin = items.tempMin
    }
}
