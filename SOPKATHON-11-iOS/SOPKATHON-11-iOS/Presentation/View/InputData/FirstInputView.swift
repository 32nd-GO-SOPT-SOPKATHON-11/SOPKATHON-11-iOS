//
//  InputDataView.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/20.
//

import UIKit
import PhotosUI

import SnapKit

final class FirstInputView: BaseView {
    
    // MARK: - Property
    
    
    
    // MARK: - UI Property
    
    private let profileImageButton: UIButton = {
        let button = UIButton()
        button.setCornerRadius(to: 76)
        button.setImage(UIImage(named: "person"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .black
        return button
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(profileImageButton)
        profileImageButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(113)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(152)
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    func configureImageView(image: UIImage) {
        profileImageButton.setImage(image, for: .normal)
    }
    
    func addImageViewAction(_ action: UIAction) {
        profileImageButton.addAction(action, for: .touchUpInside)
    }
    
}
