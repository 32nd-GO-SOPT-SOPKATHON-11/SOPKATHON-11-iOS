//
//  ButtonSetView.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/20.
//

import UIKit

import SnapKit

final class ButtonSetView: BaseView {
    
    // TODO: UI 변경
    
    // MARK: Variables
    
    private var isLeftChosen: Bool = false
    
    private var isRightChosen: Bool = false
    
    // MARK: Component
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.leftButtonTouched()
        }
        button.setTitle("남자", for: .normal)
        button.setTitleColor(.init(hex: "#9D9D9D"), for: .normal)
        button.setBorder(color: .init(hex: "#9D9D9D"), andWidth: 1)
        button.setCornerRadius(to: 6)
        button.backgroundColor = .white
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.rightButtonTouched()
        }
        button.setTitle("여자", for: .normal)
        button.setTitleColor(.init(hex: "#9D9D9D"), for: .normal)
        button.setBorder(color: .init(hex: "#9D9D9D"), andWidth: 1)
        button.setCornerRadius(to: 6)
        button.backgroundColor = .white
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    // MARK: LifeCycle
    
    
    // MARK: Layout Helpers
    
    override func setLayout() {
        addSubviews(leftButton)
        leftButton.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
            $0.trailing.equalTo(self.snp.centerX).offset(-10)
            $0.height.equalTo(42)
        }
        
        addSubviews(rightButton)
        rightButton.snp.makeConstraints {
            // TODO: 간격 조정
            $0.leading.equalTo(self.snp.centerX).offset(10)
            $0.trailing.verticalEdges.equalToSuperview()
            $0.height.equalTo(42)
        }
    }
    
    // MARK: Custom Function
    
    func setButtonTitles(_ left: String, _ right: String) {
        leftButton.setTitle(left, for: .normal)
        rightButton.setTitle(right, for: .normal)
    }
    
    private func configureButtons() {
        leftButton.backgroundColor = isLeftChosen ? .pink1 : .white
        rightButton.backgroundColor = isRightChosen ? .pink1 : .white
        leftButton.setBorder(color: isLeftChosen ? .pink1 : .init(hex: "#9D9D9D"), andWidth: 1)
        rightButton.setBorder(color: isRightChosen ? .pink1 : .init(hex: "#9D9D9D"), andWidth: 1)
        leftButton.setTitleColor(isLeftChosen ? .white : .init(hex: "#9D9D9D"), for: .normal)
        rightButton.setTitleColor(isRightChosen ? .white : .init(hex: "#9D9D9D"), for: .normal)
    }
    
    private func leftButtonTouched() {
        isLeftChosen = true
        isRightChosen = false
        configureButtons()
    }
    
    private func rightButtonTouched() {
        isLeftChosen = false
        isRightChosen = true
        configureButtons()
    }

}
