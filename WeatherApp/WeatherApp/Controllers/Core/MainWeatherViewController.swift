//
//  MainWeatherViewController.swift
//  WeatherApp
//
//  Created by Vitaly on 23.06.2024.
//

import UIKit
import SnapKit

class MainWeatherViewController: UIViewController, FlowController {
    var completionHandler: (() -> ())?
    
    var currentView = CurrentView.shared
    var precipitationView = PrecipitationView.shared
    
    //MARK: - GUI variabels
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ImageMain")
        
        return imageView
    }()
    
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
    
    private  var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        collectionView.backgroundColor = .none
        
        return collectionView
    }()
    
    private var presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightViolet.cgColor
        button.backgroundColor = .violetSerchColorVC
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentButtonTaped), for: .touchUpInside)
        
        return button
    }()
    
    private var imageButton: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "magnifyingglass")
        
        return img
    }()
    
    //MARK: - Properties
    private let sections = MockData.shared.pageData
    private var viewModel: TodayViewModelProtocol
    private var transition = CircularTransition()
    
    //MARK: - Life cycle
    init(viewModel: TodayViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: TodayCollectionViewCell.identifier)
        collectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
        
        navigationController?.delegate = self
        
        setupDataSource()
        setupNavigationViewController()
        setupUI()
    }
    
    //MARK: - Privat methods
    private func setupViewModel() {
        viewModel.reloadData = { [ weak self ] in
            self?.collectionView.reloadData()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .red
        self.view.addSubview(imageView)
        view.addSubview(currentView)
        view.addSubview(precipitationView)
        view.addSubview(collectionView)
        view.addSubview(presentButton)
        presentButton.addSubview(imageButton)
        
        setupConstraints()
    }
    
    private func setupDataSource() {
        collectionView.dataSource = self
    }
    
    private func setupNavigationViewController() {
        navigationItem.title = "Sydney"
        let search = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"),
                                     style: .done,
                                     target: self,
                                     action: #selector(reload))
        navigationItem.rightBarButtonItem = search
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    @objc
    private func reload() {
        print(#function)
    }
    
    @objc
    private func presentButtonTaped() {
        let viewModel = SearchViewModel()
        let searchViewController = SearchViewController(viewModel: viewModel)
        searchViewController.modalPresentationStyle = .custom
        searchViewController.transitioningDelegate = self
        
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}

//MARK: - Constraints
extension MainWeatherViewController {
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        currentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(115)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        precipitationView.snp.makeConstraints { make in
            make.top.equalTo(currentView.snp.bottom).offset(15)
            make.width.equalTo(295)
            make.height.equalTo(95)
            make.leading.trailing.equalToSuperview().inset(55)
            make.center.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(precipitationView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.bottom.equalTo(presentButton.snp.top).offset(-15)
        }
        
        presentButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-30)
        }
        
        imageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
    }
}

extension MainWeatherViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [ weak self ] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = sections[sectionIndex]
            switch section {
            case .todays(_):
                return self.createTodaySections()
            case .cities(_):
                return self.createCitiesSections()
            }
        }
    }
    
    private func supplementaryHeaderItems() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItem
        section.supplementariesFollowContentInsets = contentInsets
        
        return section
    }
    
    private func createTodaySections() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(54),
                                                                         heightDimension: .absolute(93)),
                                                       subitems: [item])
        let sections = createLayoutSection(group: group,
                                           behavior: .continuous,
                                           interGroupSpacing: 8,
                                           supplementaryItem: [supplementaryHeaderItems()],
                                           contentInsets: false)
        sections.contentInsets = .init(top: 0, leading: 5, bottom: 24, trailing: 25)
        return sections
    }
    
    private func createCitiesSections() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(190),
                                                                         heightDimension: .absolute(60)),
                                                       subitems: [item])
        let sections = createLayoutSection(group: group,
                                           behavior: .continuous,
                                           interGroupSpacing: 20,
                                           supplementaryItem: [supplementaryHeaderItems()],
                                           contentInsets: false)
        sections.contentInsets = .init(top: 0, leading: 5, bottom: -10, trailing: 25)
        return sections
    }
}

//MARK: - UICollectionViewDataSource
extension MainWeatherViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let weatherModel = viewModel.getItem(at: indexPath)
        
        switch sections[indexPath.section] {
        case .todays(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCollectionViewCell.identifier,
                                                                for: indexPath) as? TodayCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let todayViewModel = TodayCellViewModel(article: weatherModel)
            cell.configure(article: todayViewModel)
            
            return cell
            
        case .cities(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier,
                                                                for: indexPath) as? CityCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let cityViewModel = CitiesViewModel(article: weatherModel)
            cell.configureCity(article: cityViewModel)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HeaderSupplementaryView.identifier,
                                                                               for: indexPath) as? HeaderSupplementaryView else {
                return UICollectionReusableView()
            }
            
            header.configureHeader(categoryName: viewModel.getTitle(for: indexPath.section))
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension MainWeatherViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        transition.transitionMode = operation == .push ? .present : .dismiss
        transition.startingPoint = presentButton.center
        transition.circleColor = operation == .pop ? .white : .violetSerchColorVC
        
        return transition
    }
}

//MARK: - UIViewControllerTransitioningDelegate
extension MainWeatherViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        transition.transitionMode = .present
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor ?? UIColor.violetSerchColorVC
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        transition.transitionMode = .dismiss
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor ?? UIColor.violetSerchColorVC
        
        return transition
    }
}
