//
//  ResultViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 28.08.2024.
//

import UIKit

protocol ResultViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var numberOfCells: Int { get }
    
    func getArticles(for row: Int) -> ResultCityWeekViewModel
}

final class ResultViewModel: ResultViewModelProtocol {
    //MARK: - Properties
    var reloadData: (() -> Void)?
    
    private var articles: [SearchCityTableResultModel] = []
    
    init() {
        loadData()
    }
    
    var numberOfCells: Int {
        return articles.count
    }
    
    func getArticles(for row: Int) -> ResultCityWeekViewModel {
        let article = articles[row]
        return ResultCityWeekViewModel(items: article)
    }
    
    private func loadData() {
        mockData()
    }
    
    private func mockData() {
        articles = [
            SearchCityTableResultModel(day: "Monday", image: "cloudRainImage", forecast: "Rainy", tempMax: "+" + "20" + "°", tempMin: "+" + "19" + "°"),
            SearchCityTableResultModel(day: "Tuesday", image: "rainyWeatherImage", forecast: "Rainy", tempMax: "+" + "21" + "°", tempMin: "+" + "20" + "°"),
            SearchCityTableResultModel(day: "Wednesday", image: "cloudRainImage", forecast: "Rainy", tempMax: "+" + "19" + "°", tempMin: "+" + "16" + "°"),
            SearchCityTableResultModel(day: "Thursday", image: "rainyWeatherImage", forecast: "Rainy", tempMax: "+" + "20" + "°", tempMin: "+" + "18" + "°"),
            SearchCityTableResultModel(day: "Friday", image: "rainImage", forecast: "Rainy", tempMax: "+" + "17" + "°", tempMin: "+" + "15" + "°"),
            SearchCityTableResultModel(day: "Saturday", image: "cloudyImage", forecast: "Сloudy", tempMax: "+" + "18" + "°", tempMin: "+" + "17" + "°"),
            SearchCityTableResultModel(day: "Sunday", image: "sunny", forecast: "Sunny", tempMax: "+" + "22" + "°", tempMin: "+" + "21" + "°"),
        ]
    }
}
