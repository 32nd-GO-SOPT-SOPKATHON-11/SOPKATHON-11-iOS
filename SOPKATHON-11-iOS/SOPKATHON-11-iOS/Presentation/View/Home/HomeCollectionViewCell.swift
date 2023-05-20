//
//  HomeCollectionViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let homeIdentifier = "HomeCollectionViewCell"
    
    let profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "figure.bowling")
    }
    
    let nameLabel = UILabel()
    
    let separateView = UIView()
    
    let bornLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(
            profileImageView,
            nameLabel,
            separateView,
            bornLabel
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(250)
        }
        
        profileImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.height.equalTo(UIScreen.main.bounds.width/2)
//            $0.height.equalTo(250)
        }
        
    }
}
