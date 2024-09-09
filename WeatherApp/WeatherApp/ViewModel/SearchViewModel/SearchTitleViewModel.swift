//
//  SearchTitleViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 27.08.2024.
//

import Foundation

struct SearchTitleViewModel {
    let city: String
    let weather: String
    let temp: String
    let image: String
    let tempNight: String
    
    init(article: SearchTitleModel) {
        city = article.city
        weather = article.weather
        temp = article.temp
        image = article.image
        tempNight = article.tempNight
    }
}
