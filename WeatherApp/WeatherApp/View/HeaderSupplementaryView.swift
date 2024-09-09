//
//  HeaderSupplementaryView.swift
//  WeatherApp
//
//  Created by Vitaly on 17.07.2024.
//

import UIKit
import SnapKit

class HeaderSupplementaryView: UICollectionReusableView {
    static let identifier = "HeaderSupplementaryView"
    
    //MARK: - GUI variabels
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .grayColor
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Initialisetion
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    //MARK: Privet Methods
    private func setupUI() {
        addSubview(headerLabel)
        setupConstraints()
    }
}

//MARK: - Constraints
extension HeaderSupplementaryView {
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(5)
        }
    }
}
