//
//  NavigationBarView.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class NavigationBarView : UIView {
    
    private let navigationBackButton = UIButton()
    private let navigationTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NavigationBarView {
    func setUI() {
        
        navigationBackButton.do {
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.tintColor = .black
        }
        
        navigationTitle.do {
            $0.text = "프로필 보여드려유"
            $0.font = .boldSystemFont(ofSize: 20)
        }
    }
    
    func setHierarchy() {
        
        addSubviews(navigationBackButton, navigationTitle)
    }
    
    func setLayout() {
        navigationBackButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(30)
        }
        
        navigationTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setTitleBind(title : String) {
        navigationTitle.text = title
    }

}
