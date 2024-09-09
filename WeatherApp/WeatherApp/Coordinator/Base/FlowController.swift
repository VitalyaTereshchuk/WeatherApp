//
//  FlowController.swift
//  WeatherApp
//
//  Created by Vitaly on 05.09.2024.
//

import UIKit

protocol FlowController {
    var completionHandler: (() -> ())? { get set }
}
