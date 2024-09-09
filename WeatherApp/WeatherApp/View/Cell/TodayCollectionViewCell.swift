//
//  TodayCollectionViewCell.swift
//  WeatherApp
//
//  Created by Vitaly on 24.06.2024.
//

import UIKit
import SnapKit

class TodayCollectionViewCell: UICollectionViewCell {
    static let identifier = "TodayCollectionViewCell"
    
    //MARK: - GUI variabels
    private lazy var rectangleView: TodayGradientView = {
        let view = TodayGradientView(colors: [UIColor.lightViolet.cgColor,
                                              UIColor.violetGradient.cgColor,
                                              UIColor.violetGradient.cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        
        return view
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,
                                                       imageContainer,
                                                       temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 9
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                     leading: 8,
                                                                     bottom: 8,
                                                                     trailing: 8)
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .clear
        stackView.layer.shadowOffset = CGSize(width: 0, height: 0)
        stackView.layer.shadowColor = UIColor.white.cgColor
        stackView.layer.cornerCurve = .continuous
        stackView.layer.shadowRadius = 1
        
        return stackView
    }()
    
    //MARK: - Initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat methods
    private func setupUI() {
        contentView.addSubview(rectangleView)
        rectangleView.addSubview(stackView)
        imageContainer.addSubview(imageView)
        setupConstraints()
    }
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-"
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "cloudRainImage")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "-°"
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .grayColor
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Methods
    func configure(article: TodayCellViewModel) {
        hourLabel.text = article.time
        imageView.image = UIImage(named: article.image)
        temperatureLabel.text = article.temp
    }
}

//MARK: - Constraints
extension TodayCollectionViewCell {
    private func setupConstraints() {
        rectangleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(36)
            make.center.equalToSuperview()
        }
        
        hourLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
    }
}
