//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isInstalled = false
        
        if !isInstalled {
            showLocationFlow()
        } else {
            showMainFlow()
        }
    }
    
    private func showLocationFlow() {
        let locationCoordinator = CoordinatorFactory().createLocationCoordinator(navigationController: navigationController)
        childCoordinators.append(locationCoordinator)
        
        locationCoordinator.flowCompletionHandler = { [ weak self ] in
            self?.showMainFlow()
        }
        
        locationCoordinator.start()
    }
    
    private func showMainFlow() {
        navigationController.setViewControllers([MainWeatherViewController(viewModel: TodayViewModel())], animated: true)
    }
}
