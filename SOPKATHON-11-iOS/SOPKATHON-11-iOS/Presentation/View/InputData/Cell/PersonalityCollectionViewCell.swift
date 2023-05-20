//
//  PersonalityCollectionViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class PersonalityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifer = "PersonalityCollectionViewCell"
    
    // MARK: - UI Property
    
    private let hobbyTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(hobbyTitleLabel)
        hobbyTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    func configureCell(with text: String) {
        hobbyTitleLabel.text = text
    }
    
    func toggleCell() {
        hobbyTitleLabel.backgroundColor = 
    }
    
}
