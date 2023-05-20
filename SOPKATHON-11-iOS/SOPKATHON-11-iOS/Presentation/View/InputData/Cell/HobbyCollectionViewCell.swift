//
//  HobbyCollectionViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class HobbyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifer = "HobbyCollectionViewCell"
    
    // MARK: - UI Property
    
    private let hobbyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        return imageView
    }()
    
    private let hobbyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black.withAlphaComponent(0.68)
        return button
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(hobbyImageView)
        hobbyImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(hobbyButton)
        hobbyButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
}
