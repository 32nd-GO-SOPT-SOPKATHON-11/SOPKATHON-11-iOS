//
//  MatchingListView.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/21.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class MatchingListView: UIView{
    
    // MARK: Component
    
    private lazy var profileImage = UIImageView().then{
        $0.kfSetImage(url: HomeViewController().dummyList[0].profileImage)
        $0.layer.cornerRadius = self.frame.width / 2
        $0.layer.masksToBounds = true
    }
    
    private let profileName = UILabel().then{
        $0.text = "이영수"
        $0.font = .semibold28
    }
    
    private let bornYear = UILabel().then{
        $0.text = "1954년생"
        $0.font = .regular28
    }
    
    private let verticalWall = UIView().then {
        $0.backgroundColor = .gray
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Layout Helpers
    
    private func setUI(){
        addSubviews(
            profileImage,
            profileName,
            bornYear,
            verticalWall
        )
        
        profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(68)
            $0.width.equalTo(199)
            $0.height.equalTo(199)
        }
        
        profileName.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.trailing.equalTo(bornYear.snp.leading).offset(-17)
        }
        
        verticalWall.snp.makeConstraints{
            $0.top.equalTo(profileName.snp.top)
            $0.bottom.equalTo(profileName.snp.bottom)
            $0.leading.equalTo(profileName.snp.trailing).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1)
        }
        
        bornYear.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.leading.equalTo(verticalWall.snp.trailing).offset(8)
        }
    }
    
    
}





