//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 27.08.2024.
//

import UIKit

protocol SearchViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var numberOfCells: Int { get }
    
    func getArticles(for row: Int) -> SearchTitleViewModel
    func filterArticles(for searchText: String)
}

final class SearchViewModel: SearchViewModelProtocol {
    //MARK: - Properties
    var reloadData: (() -> Void)?
    
    private var articles: [SearchTitleModel] = []
    private var filteredArticles: [SearchTitleModel] = []
    
    var numberOfCells: Int {
        return filteredArticles.count
    }
    
    init() {
        loadData()
    }
    
    func getArticles(for row: Int) -> SearchTitleViewModel {
        let article = filteredArticles[row]
        return SearchTitleViewModel(article: article)
    }
    
    private func loadData() {
        mockData()
        filteredArticles = articles
    }
    
    private func mockData() {
        articles = [
            SearchTitleModel(city: "Moscow", weather: "Сloudy", temp: "23", image: "cloudyWeatherImage", tempNight: "20"),
            SearchTitleModel(city: "London", weather: "Rainy", temp: "24", image: "cloudyRainImage", tempNight: "21"),
            SearchTitleModel(city: "Canberra", weather: "Sunny", temp: "37", image: "sunnyWeather", tempNight: "31"),
            SearchTitleModel(city: "Los Angeles", weather: "Rainy", temp: "29", image: "rainCloudyImage", tempNight: "25"),
            SearchTitleModel(city: "Tokyo", weather: "Сloudy", temp: "25", image: "cloudyWeatherImage", tempNight: "20"),
            SearchTitleModel(city: "Miami", weather: "Sunny", temp: "42", image: "sunnyWeather", tempNight: "36"),
            SearchTitleModel(city: "Birmingham", weather: "Rainy", temp: "20", image: "cloudyRainImage", tempNight: "18"),
            SearchTitleModel(city: "Montreal", weather: "Сloudy", temp: "14", image: "rainCloudyImage", tempNight: "11")
        ]
    }
    
    func filterArticles(for searchText: String) {
        if searchText.isEmpty {
            filteredArticles = []
        } else {
            filteredArticles = searchText.isEmpty ? articles : articles.filter { $0.city.lowercased().contains(searchText.lowercased()) }
            reloadData?()
        }
    }
}
