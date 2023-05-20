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
    
    var isChange = false
    
    var onButton: UIImage?
    var offButton: UIImage?
    
    let missionImage = UIImageView()
    let missionTitle = UILabel().then{
        $0.font = .regular17
    }
    let missionclearButton = UIButton().then{
        $0.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
    }
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        onButton = UIImage(named: "btn_check_on")
        offButton = UIImage(named: "btn_check_off")
        self.missionclearButton.setImage(offButton, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function

    override func layoutSubviews() {
        super.layoutSubviews()
        // Cell 간격 조정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 0))
    }
    
    func setView() {

        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.gray1.cgColor
        contentView.backgroundColor = .white
        
        
        addSubviews(
            missionImage,
            missionTitle,
            missionclearButton
        )
        
        missionImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(8)
            $0.width.equalTo(86)
            $0.height.equalTo(68)
            $0.centerY.equalToSuperview()
        }
        
        missionTitle.snp.makeConstraints {
            $0.centerY.equalTo(missionImage.snp.centerY)
            $0.leading.equalTo(missionImage.snp.trailing).offset(10)
        }
        missionclearButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(14)
            $0.top.bottom.equalToSuperview().inset(21)
            $0.centerY.equalToSuperview()
        }
    }
    
    
    
    
    
    @objc
    private func toggleButton(){
        isChange.toggle()

        if !isChange{
            self.missionclearButton.setImage(onButton, for: .normal)
        }
        else{
            self.missionclearButton.setImage(offButton, for: .normal)

        }
    }
}

