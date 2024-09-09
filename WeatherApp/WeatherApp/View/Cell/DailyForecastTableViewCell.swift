//
//  DailyForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Vitaly on 09.08.2024.
//

import UIKit
import SnapKit

final class DailyForecastTableViewCell: UITableViewCell {
    static let identifier = "DailyForecastTableViewCell"
    
    //MARK: - GUI variables
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Monday"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ImageCurrent")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = UIColor.clear
        
        return img
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        
        return label
    }()
    
    private lazy var weatherStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView,
                                                       weatherLabel])
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.backgroundColor = UIColor.clear
        
        return stackView
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let temp = UILabel()
        temp.text = "25" + "°"
        temp.font = .systemFont(ofSize: 15, weight: .bold)
        temp.textAlignment = .right
        temp.textColor = UIColor.white
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let temp = UILabel()
        temp.text = "21" + "°"
        temp.font = .systemFont(ofSize: 15, weight: .bold)
        temp.textColor = UIColor.white
        temp.textAlignment = .right
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    private lazy var tempStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [maxTemperatureLabel,
                                                      minTemperatureLabel])
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.backgroundColor = UIColor.clear

        return stackView
    }()
    
    private lazy var mainContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel,
                                                       weatherStackView,
                                                       tempStackView])
              stackView.axis = .horizontal
              stackView.translatesAutoresizingMaskIntoConstraints = false
              stackView.isLayoutMarginsRelativeArrangement = true
              stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                           leading: 16,
                                                                           bottom: 16,
                                                                           trailing: 16)
              stackView.spacing = 15
              return stackView
    }()
    
    
    
    
    //MARK: - Initialisetion
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat methods
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(mainContainerStackView)
        setupConstraints()
    }
    
    //MARK: - Methods
    func configureCell(with model: ResultCityWeekViewModel) {
        weekDayLabel.text = model.day
        iconImageView.image = UIImage(named: model.image)
        weatherLabel.text = model.forecast
        maxTemperatureLabel.text = model.tempMax
        minTemperatureLabel.text = model.tempMin
    }
}

extension DailyForecastTableViewCell {
    private func setupConstraints() {
        mainContainerStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(51)
        }
        
        weekDayLabel.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        
        weatherStackView.snp.makeConstraints { make in
            make.width.equalTo(125)
        }
        
        maxTemperatureLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
        minTemperatureLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
    }
}
