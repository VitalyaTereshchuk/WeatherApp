//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

typealias CoordinatorHandler = () -> ()

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
