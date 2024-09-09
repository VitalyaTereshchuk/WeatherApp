//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 26.08.2024.
//

import Foundation

struct CitiesViewModel {
    let image: String
    let city: String
    let forecast: String
    let temp: String
    
    init(article: WeatherModel) {
        image = article.image
        city = article.city
        forecast = article.forecast
        temp = article.temp
    }
}
