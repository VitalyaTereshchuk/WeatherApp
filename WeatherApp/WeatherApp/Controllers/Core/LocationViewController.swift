//
//  LocationViewController.swift
//  WeatherApp
//
//  Created by Vitaly on 04.09.2024.
//

import UIKit
import SnapKit

final class LocationViewController: UIViewController, FlowController {
    var completionHandler: (() -> ())?
    
    //MARK: - GUI variabels
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "locationImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to the"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weather App"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private lazy var welcomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel,
                                                       weatherLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private var request1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please share your current location to get the"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    private var request2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "weather in your area"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    private lazy var requestStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [request1Label,
                                                       request2Label])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.setTitle("Share Current Location", for: .normal)
        button.setImage(UIImage(systemName: "location"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .lilacButtonColor
        button.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
        
        let imageOfSet: CGFloat = 8
        button.configuration?.imagePadding = imageOfSet
        
        return button
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    //MARK: - Privat methods
    @objc
    private func didPressNextButton() {
        completionHandler?()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(welcomeStackView)
        view.addSubview(requestStackView)
        view.addSubview(locationButton)
    }
}

//MARK: - Contraints
extension LocationViewController {
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom).offset(50)
        }
        
        welcomeStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
        requestStackView.snp.makeConstraints { make in
            make.top.equalTo(welcomeStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        locationButton.snp.makeConstraints { make in
            make.top.equalTo(requestStackView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
}
