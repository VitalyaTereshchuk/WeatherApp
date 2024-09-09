//
//  ListSections.swift
//  WeatherApp
//
//  Created by Vitaly on 13.07.2024.
//

import UIKit

enum ListSections {
    case todays([WeatherModel])
    case cities([WeatherModel])
    
    var items: [WeatherModel] {
        switch self {
        case.todays(let items),
                .cities(let items):
            
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case.todays(_):
            return "Today".uppercased()
        case.cities(_):
            return "Other Cities".uppercased()
        }
    }
}
