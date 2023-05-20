//
//  ProfileDetailTableViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class ProfileDetailTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileDetailTableViewCell"
    
    let profileDetailTitle = UILabel()
    lazy var profileDetailText = UILabel()
    let profileDetailLine = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileDetailTableViewCell {
    func setUI() {
        profileDetailTitle.do {
            $0.text = "지역"
            $0.font = .systemFont(ofSize: 16)
        }
        
        profileDetailText.do {
            $0.font = .systemFont(ofSize: 17)
            $0.textColor = UIColor.gray
        }

        profileDetailLine.do {
            $0.backgroundColor = UIColor.gray
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(profileDetailTitle, profileDetailText, profileDetailLine)
    }
    
    func setLayout() {
        profileDetailTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(46)
        }
        
        profileDetailText.snp.makeConstraints {
            $0.top.equalTo(profileDetailTitle.snp.bottom).offset(13)
            $0.leading.equalTo(46)
        }
        profileDetailLine.snp.makeConstraints {
            $0.top.equalTo(profileDetailTitle.snp.bottom).inset(2)
            $0.width.equalTo(297)
        }
    }
    
}
