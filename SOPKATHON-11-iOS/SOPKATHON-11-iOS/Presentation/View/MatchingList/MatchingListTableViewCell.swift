//
//  MatchingListTableViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class MissionListTableViewCell: UITableViewCell {
    
    // MARK: Component
    
    let missionImage = UIImageView()
    let missionTitle = UILabel()
    let missionclearButton = UIButton()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function

    override func layoutSubviews() {
        super.layoutSubviews()
        // Cell 간격 조정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
    }
    
    func setView() {

        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .blue
        
        addSubviews(
            missionImage,
            missionTitle,
            missionclearButton
        )
        
        missionImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(8)
            $0.width.equalTo(86)
            $0.centerY.equalToSuperview()
        }
        
        missionTitle.snp.makeConstraints {
            $0.centerY.equalTo(missionImage.snp.centerY)
            $0.leading.equalTo(missionImage.snp.trailing).offset(10)
        }
        missionclearButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(7)
            $0.centerY.equalToSuperview()
        }
    }
}

