//
//  PrecipitationSearchView.swift
//  WeatherApp
//
//  Created by Vitaly on 08.08.2024.
//

import UIKit
import SnapKit

class PrecipitationSearchView: UIView {
    static let shared = PrecipitationSearchView()
    
    //MARK: - GUI variabel
    private var precipitationClearView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var rectangleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [precipitationStackView,
                                                  humidityStackView,
                                                  windSpeedStackView])
        view.backgroundColor = .clear
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //precipitation
    private lazy var precipitationStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [precipitationImage,
                                                  percentPrecipitationLabel,
                                                  precipitationLabel])
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var precipitationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "umbrellaImage")
        
        return imageView
    }()
    
    private lazy var percentPrecipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "30%"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    private var precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "Precipitation"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    //humidity
    private lazy var humidityStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [humidityImage,
                                                  percentHumidityLabel,
                                                  humidityLabel])
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var humidityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "dropImage")
        
        return imageView
    }()
    
    private lazy var percentHumidityLabel: UILabel = {
        let label = UILabel()
        label.text = "20%"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    private var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    //Wind Speed
    private lazy var windSpeedStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [windSpeedImage,
                                                  percentWindSpeedLabel,
                                                  windSpeedLabel])
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var windSpeedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "windImage")
        
        return imageView
    }()
    
    private lazy var percentWindSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "9km/h"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    private var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind Speed"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePrecipitation(with model: SearchTitleModel) {
//        percentPrecipitationLabel.text = model.precipitationWeather
//        percentHumidityLabel.text = model.humidity
//        percentWindSpeedLabel.text = model.windSpeed
    }
    
    //MARK: - Privat methods
    private func setupUI() {
        addSubview(precipitationClearView)
        precipitationClearView.addSubview(rectangleStackView)
        setupConstraint()
    }
}

extension PrecipitationSearchView {
   private func setupConstraint() {
       precipitationClearView.snp.makeConstraints { make in
           make.top.bottom.equalToSuperview().inset(10)
           make.leading.trailing.equalToSuperview().inset(20)
           make.width.equalTo(223)
           make.center.equalToSuperview()
       }
       
       rectangleStackView.snp.makeConstraints { make in
           make.leading.trailing.top.bottom.equalToSuperview()
       }
       
       precipitationImage.snp.makeConstraints { make in
           make.width.height.equalTo(24)
       }
       
       humidityImage.snp.makeConstraints { make in
           make.width.height.equalTo(24)
       }
       
       windSpeedImage.snp.makeConstraints { make in
           make.width.height.equalTo(24)
       }
    }
}
