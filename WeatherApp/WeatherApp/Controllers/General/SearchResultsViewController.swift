//
//  SearchResultsViewController.swift
//  WeatherApp
//
//  Created by Vitaly on 28.07.2024.
//

import UIKit
import SnapKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerProtocol(_ viewModel: SearchTitleViewModel)
}

final class SearchResultsViewController: UIViewController {
    //MARK: - GUI variabels
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    public let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchTitleCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchTitleCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    //MARK: - Properties
    private var viewModel: SearchViewModelProtocol
    
    //MARK: - Life cycle
    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewModel() {
        viewModel.reloadData = { [ weak self ] in
            self?.searchResultCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Privat methods
    private func setupUI() {
        view.backgroundColor = .clear
        searchResultCollectionView.frame = view.bounds
        view.addSubview(searchResultCollectionView)
        setupDelegate()
    }
    
    private func setupDelegate() {
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource
extension SearchResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchTitleCollectionViewCell.identifier,
                                                            for: indexPath) as? SearchTitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = viewModel.getArticles(for: indexPath.row)
        cell.configureCell(with: title)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension SearchResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    
        let title = viewModel.getArticles(for: indexPath.row)
        delegate?.searchResultsViewControllerProtocol(SearchTitleViewModel(article: SearchTitleModel(city: "", 
                                                                                                     weather: "",
                                                                                                     temp: title.temp,
                                                                                                     image: title.image,
                                                                                                     tempNight: title.tempNight)))
    }
}
