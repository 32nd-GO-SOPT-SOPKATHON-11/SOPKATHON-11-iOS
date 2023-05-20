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
        // TODO: title 관련 사항 변경
        // TODO: button 색상 변경
        button.setTitle("남자", for: .normal)
        button.backgroundColor = .gray
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.rightButtonTouched()
        }
        // TODO: title 관련 사항 변경
        // TODO: button 색상 변경
        button.setTitle("여자", for: .normal)
        button.backgroundColor = .gray
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
        }
        
        addSubviews(rightButton)
        rightButton.snp.makeConstraints {
            // TODO: 간격 조정
            $0.leading.equalTo(self.snp.centerX).offset(10)
            $0.trailing.verticalEdges.equalToSuperview()
        }
    }
    
    // MARK: Custom Function
    
    private func configureButtons() {
        leftButton.backgroundColor = isLeftChosen ? .black : .gray
        rightButton.backgroundColor = isRightChosen ? .black : .gray
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
