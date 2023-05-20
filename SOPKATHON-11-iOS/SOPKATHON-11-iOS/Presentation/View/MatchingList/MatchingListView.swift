//
//  MatchingListView.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class MatchingListView: UIView{
    
    // MARK: Component
    
    //    private let profileImage = UIImageView().then{
    //        $0.backgroundColor = .red
    //        $0.layer.cornerRadius = $0.fram.height/2
    //
    //    }
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.layer.cornerRadius = image.frame.height/2
        image.layer.borderWidth = 1
        image.clipsToBounds = true
        return image
    }()
    
    
    //    private let nameLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "이름이 무엇인가요!?"
    //        label.font = .systemFont(ofSize: 16)
    //        label.textColor = .blue
    //        label.textAlignment = .center
    //        return label
    //    }()
    
    
    
    //    cell.userImageView.layer.cornerRadius = cell.userImageView.frame.height/2
    //    cell.userImageView.layer.borderWidth = 1
    //    cell.userImageView.layer.borderColor = UIColor.clear.cgColor
    //    // 뷰의 경계에 맞춰준다
    //    cell.userImageView.clipsToBounds = true
    
    
    
    private let profileName = UILabel().then{
        $0.text = "여민서"
    }
    
    private let bornYear = UILabel().then{
        $0.text = "1958년생"
    }
    
    private let verticalWall = UIView().then {
        $0.backgroundColor = .white
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
            $0.width.equalTo(150)
            $0.height.equalTo(150)
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





