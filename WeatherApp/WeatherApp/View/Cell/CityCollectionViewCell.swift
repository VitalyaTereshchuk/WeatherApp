//
//  CityCollectionViewCell.swift
//  WeatherApp
//
//  Created by Vitaly on 15.07.2024.
//

import UIKit
import SnapKit

class CityCollectionViewCell: UICollectionViewCell {
    static let identifier = "CityCollectionViewCell"
    
    //MARK: - GUI variabels
    private var mainView: CityGradientView = {
        let view = CityGradientView(colors: [UIColor.blueDarkGradient.cgColor,
                                             UIColor.pinkGradient.cgColor,
                                             UIColor.orangeGradient.cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ImageCurrent")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Moscow"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .grayColor
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var cityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cityLabel, forecastLabel])
        stack.axis = .vertical
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                 leading: 0,
                                                                 bottom: 8,
                                                                 trailing: 0)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = .clear
        
        return stack
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "25°"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
//    func configureCell(imageViewName: String, cityLabelName: String, forecastLabelName: String, temperatureLabelName: String ) {
//        imageView.image = UIImage(named: imageViewName)
//        cityLabel.text = cityLabelName
//        forecastLabel.text = forecastLabelName
//        temperatureLabel.text = temperatureLabelName
//    }
    
    func configureCity(article: CitiesViewModel) {
        imageView.image = UIImage(named: article.image)
        cityLabel.text = article.city
        forecastLabel.text = article.forecast
        temperatureLabel.text = article.temp
    }
    
    //MARK: Privat methods
    private func setupUI() {
        contentView.addSubview(mainView)
        mainView.addSubview(viewContainer)
        mainView.addSubview(cityStackView)
        mainView.addSubview(temperatureLabel)
        viewContainer.addSubview(imageView)
        setupConstraints()
    }
}

//MARK: - Contraints
extension CityCollectionViewCell {
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewContainer.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(45)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
            make.bottom.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
        }
        
        cityStackView.snp.makeConstraints { make in
            make.leading.equalTo(viewContainer.snp.trailing).offset(4)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.leading.equalTo(cityStackView.snp.trailing).offset(5)
            make.top.trailing.bottom.equalToSuperview().inset(8)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.width.equalTo(45)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        forecastLabel.snp.makeConstraints { make in
            make.height.equalTo(11)
        }
    }
}
