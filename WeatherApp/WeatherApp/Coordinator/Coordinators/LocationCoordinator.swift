//
//  LocationCoordinator.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

final class LocationCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: CoordinatorHandler?
    private let moduleFactory =  ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLocationVC()
    }
    
    private func showLocationVC() {
        let controller = moduleFactory.createLocationVC()
        controller.completionHandler = { [ weak self ] in
            self?.flowCompletionHandler?()
        }
        navigationController.pushViewController(controller, animated: true)
    }
}
