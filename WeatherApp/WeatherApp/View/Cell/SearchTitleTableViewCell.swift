//
//  SearchTitleTableViewCell.swift
//  WeatherApp
//
//  Created by Vitaly on 24.07.2024.
//

import UIKit
import SnapKit

class SearchTitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchTitleCollectionViewCell"
    
    //MARK: - GUI variabels
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private var mainView: SearchGradient = {
        let view = SearchGradient(colors: [UIColor.lightLilacColor.cgColor,
                                           UIColor.lilacColor.cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.lightLilacColor.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Moscow"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunny"
        label.numberOfLines = 0
        label.textColor = .grayColor
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityLabel, weatherLabel])
        stackView.axis = .vertical
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5,
                                                                     leading: 0,
                                                                     bottom: 5,
                                                                     trailing: 0)
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private var tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private  var imageWeather: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ImageCurrent")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureCell(with model: SearchTitleViewModel) {
        cityLabel.text = model.city
        weatherLabel.text = model.weather
        tempLabel.text = model.temp + " " + "C°"
        imageWeather.image = UIImage(named: model.image)
    }
    
//    func configureCell(article: SearchTitleViewModel) {
//        cityLabel.text = article.city
//        weatherLabel.text = article.weather
//        tempLabel.text = article.temp + " " + "C°"
//        imageWeather.image = UIImage(named: article.image)
//    }
    
    //MARK: - Private methods
    private func setupUI() {
        self.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(mainView)
        mainView.addSubview(stackView)
        mainView.addSubview(tempLabel)
        containerView.addSubview(imageWeather)
    }
}

//MARK: - Constraints
extension SearchTitleCollectionViewCell {
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        mainView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(21)
            make.bottom.equalToSuperview().inset(14)
            make.height.equalTo(90)
            make.width.equalTo(300)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(11)
            make.leading.equalToSuperview().inset(40)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(11)
            make.trailing.equalToSuperview().inset(60)
        }
        
        imageWeather.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.trailing).offset(-27)
            make.top.bottom.equalToSuperview().inset(9)
            make.height.equalTo(75)
            make.width.equalTo(55)
        }
    }
}
