//
//  CoordinatorFactory.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

final class CoordinatorFactory {
    func createLocationCoordinator(navigationController: UINavigationController) -> LocationCoordinator {
        LocationCoordinator(navigationController: navigationController)
    }
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
}
