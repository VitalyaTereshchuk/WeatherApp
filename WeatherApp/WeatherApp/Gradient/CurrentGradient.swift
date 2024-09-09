//
//  SearchGradient.swift
//  WeatherApp
//
//  Created by Vitaly on 26.07.2024.
//

import UIKit

class CurrentGradient: UIView {
    let gradient = CAGradientLayer()
    
    init(colors: [CGColor]) {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        layer.addSublayer(gradient)
        gradient.startPoint = CGPoint(x: 0, y: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
        gradient.cornerRadius = 15
    }
}
