//
//  CurrentView.swift
//  WeatherApp
//
//  Created by Vitaly on 28.06.2024.
//

import UIKit
import SnapKit

class CurrentView: UIView {
    static let shared = CurrentView()
    
    //MARK: - GUI variabels
    private lazy var mainlyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mostly Sunny"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .grayColor
        
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let weather = UIImageView()
        weather.image = UIImage(named: "ImageCurrent")
        weather.translatesAutoresizingMaskIntoConstraints = false
        
        return weather
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25C°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 45, weight: .bold)
        
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Friday, 26 August 2022 | 10:00"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .grayColor
        
        return label
    }()
    
    private lazy var currentWeatherStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mainlyLabel,
                                                  weatherImage,
                                                  tempLabel,
                                                  dayLabel])
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Initialisetion
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privet methods
    private func setupUI() {
        addSubview(currentWeatherStackView)
        setupConstraints()
    }
}

//MARK: - Constraints
extension CurrentView {
    private func setupConstraints() {
        currentWeatherStackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        weatherImage.snp.makeConstraints { make in
            make.width.equalTo(152)
            make.height.equalTo(119)
        }
    }
}
