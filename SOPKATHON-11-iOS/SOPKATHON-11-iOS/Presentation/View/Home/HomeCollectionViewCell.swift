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
        //        $0.image = UIImage(systemName: "figure.bowling")
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = "천성우"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let separateView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    lazy var bornLabel = UILabel().then {
        $0.text = "1954년생"
        $0.font = .systemFont(ofSize: 20)
    }
    
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
            $0.width.equalTo(162)
            $0.height.equalTo(254)
        }
        
        profileImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(220)
            $0.width.equalTo(162)
//            $0.width.height.equalTo(UIScreen.main.bounds.width/2)
//            $0.height.equalTo(250)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(7)
        }
        
        separateView.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.height.equalTo(24)
            $0.width.equalTo(1)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(11)
        }
        
        bornLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(5)
        }
        
    }
    
    func configureHomeCell(_ index: Int) {
//        nameLabel.text = HomeViewController().homeList.data[index].name
//        bornLabel.text = String(HomeViewController().homeList.data[index].age) + "년생"
    }
}
