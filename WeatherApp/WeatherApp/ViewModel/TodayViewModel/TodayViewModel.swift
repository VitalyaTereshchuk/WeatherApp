//
//  TodayViewModel.swift
//  WeatherApp
//
//  Created by Vitaly on 17.07.2024.
//

import UIKit

protocol TodayViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var numberOfSections: Int { get }
    
    func numberOfItems(in section: Int) -> Int
    func getItem(at indexPath: IndexPath) -> WeatherModel
    func getTitle(for section: Int) -> String
}

final class TodayViewModel: TodayViewModelProtocol {
    var reloadData: (() -> Void)?
    
    //MARK: - Properties
    private var sections: [ListSections] = MockData.shared.pageData
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return sections[section].count
    }
    
    func getItem(at indexPath: IndexPath) -> WeatherModel {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    func getTitle(for section: Int) -> String {
        return sections[section].title
    }
}
