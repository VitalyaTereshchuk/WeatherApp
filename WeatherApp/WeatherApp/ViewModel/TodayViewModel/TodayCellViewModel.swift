//
//  TodayCellViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 26.08.2024.
//

import Foundation

struct TodayCellViewModel {
    let time: String
    let image: String
    let temp: String
    
    init(article: WeatherModel) {
        time = article.time
        image = article.image
        temp = article.temp
    }
}
