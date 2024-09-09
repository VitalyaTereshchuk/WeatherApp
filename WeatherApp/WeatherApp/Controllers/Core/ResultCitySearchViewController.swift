//
//  ResultCitySearchViewController.swift
//  WeatherApp
//
//  Created by Vitaly on 08.08.2024.
//

import UIKit
import SnapKit

final class ResultCitySearchViewController: UIViewController {
    var precipitationSearchView = PrecipitationSearchView()
    private var viewModel: ResultViewModelProtocol
    
    //MARK: - GUI variabels
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "mainResultImage")
        
        return imageView
    }()
    
    private var currentView: CurrentGradient = {
        let view = CurrentGradient(colors: [UIColor.lightLilacColor.cgColor,
                                            UIColor.lilacColor.cgColor])
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var weatherImageCurrentView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ImageCurrent")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private var tempDayLabel: UILabel = {
        var label = UILabel()
        label.text = "23"
        label.textColor = .white
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var gradusDayLabel: UILabel = {
        let label = UILabel()
        label.text = "°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var beakSlashImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "line")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private var tempNightLabel: UILabel = {
        var label = UILabel()
        label.text = "17"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var gradusNightLabel: UILabel = {
        let label = UILabel()
        label.text = "°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dailyForecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(DailyForecastTableViewCell.self,
                           forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    init(viewModel: ResultViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewModel() {
        viewModel.reloadData = { [ weak self ] in
            self?.dailyForecastTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    //MARK: - Methods
    func configure(with model: SearchTitleViewModel) {
        weatherImageCurrentView.image = UIImage(named: model.image)
        tempDayLabel.text = model.temp
        tempNightLabel.text = model.tempNight
    }
    
    //MARK: - Privat methods
    private func setupUI() {
        self.title = "7 Days"
        view.addSubview(imageView)
        view.addSubview(currentView)
        view.addSubview(dailyForecastTableView)
        currentView.addSubview(weatherImageCurrentView)
        currentView.addSubview(tempDayLabel)
        currentView.addSubview(beakSlashImage)
        currentView.addSubview(gradusDayLabel)
        currentView.addSubview(tempNightLabel)
        currentView.addSubview(gradusNightLabel)
        currentView.addSubview(precipitationSearchView)
    }
}

extension ResultCitySearchViewController {
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom).offset(50)
        }
        
        currentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(115) //115
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(255)
        }
        
        weatherImageCurrentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(80)
            make.width.equalTo(129)
        }
        
        tempDayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalTo(weatherImageCurrentView.snp.trailing).offset(45)
        }
        
        gradusDayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(33)
            make.leading.equalTo(tempDayLabel.snp.trailing)
        }
        
        beakSlashImage.snp.makeConstraints { make in
            make.top.equalTo(tempDayLabel.snp.bottom).offset(-30)
            make.leading.equalTo(tempDayLabel.snp.trailing).offset(10)
            make.height.equalTo(30)
        }
        
        tempNightLabel.snp.makeConstraints { make in
            make.top.equalTo(beakSlashImage.snp.bottom).offset(-20)
            make.leading.equalTo(beakSlashImage.snp.trailing).offset(10)
        }
        
        gradusNightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(63)
            make.leading.equalTo(tempNightLabel.snp.trailing)
        }
        
        precipitationSearchView.snp.makeConstraints { make in
            make.top.equalTo(weatherImageCurrentView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        dailyForecastTableView.snp.makeConstraints { make in
            make.top.equalTo(currentView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}

//MARK: - UITableViewDataSource
extension ResultCitySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier,
                                                       for: indexPath) as? DailyForecastTableViewCell else {
            return UITableViewCell()
        }
        
        let article = viewModel.getArticles(for: indexPath.row)
        cell.configureCell(with: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}
