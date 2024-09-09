//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Vitaly on 22.07.2024.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    private var viewModel: SearchViewModelProtocol
    
    //MARK: - GUI variables
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "searchMainImage")
        
        return imageView
    }()
    
    private lazy var searchController: UISearchController = {
        let searchViewController = SearchResultsViewController(viewModel: viewModel)
        let search = UISearchController(searchResultsController: searchViewController)
        
        return search
    }()
    
    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var transition = PushTransition()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupUI()
    }
    
    //MARK: - Privet methods
    private func setupUI() {
        self.title = "Search"
        
        setupDelegate()
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.placeholder = "Search for City"
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupDelegate() {
        searchController.searchResultsUpdater = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(imageView)
    }
}

extension SearchViewController {
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(50)
            
        }
    }
}

//MARK: - UISearchResultsUpdating, SearchResultsViewControllerDelegate
extension SearchViewController: UISearchResultsUpdating, SearchResultsViewControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let text = searchBar.text,
              text.trimmingCharacters(in: .whitespaces).count >= 2,
              let resultController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        resultController.delegate = self
        
        viewModel.filterArticles(for: text )
    }
    
    func searchResultsViewControllerProtocol(_ viewModel: SearchTitleViewModel) {
        let resultViewModel = ResultViewModel() as ResultViewModelProtocol
        let weatherDetailVC = ResultCitySearchViewController(viewModel: resultViewModel)
        weatherDetailVC.configure(with: viewModel)
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
}
