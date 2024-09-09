//
//  ModuleFactory.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

final class ModuleFactory {
    func createLocationVC() -> LocationViewController {
        LocationViewController()
    }
    
    func createMainVC() -> MainWeatherViewController {
        MainWeatherViewController(viewModel: TodayViewModel())
    }
}
