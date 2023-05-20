//
//  TextfieldWithLabelView.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class TextfieldWithLabelView: BaseView {
    
    // MARK: - UI Property
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        // TODO: font size 변경
        return label
    }()
    
    private let contentTextField: UITextField = {
        let textField = UITextField()
        // TODO: font size 변경
        textField.setBorder(color: .gray, andWidth: 1)
        textField.setLeftPaddingPoints(8)
        return textField
    }()
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        addSubviews(contentTextField)
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(42)
        }
    }
    
    // MARK: - Custom Method
    
    func setTitleLableText(to title: String) {
        titleLabel.text = title
    }
    
    func setTextFieldPlaceholder(to placeholder: String) {
        contentTextField.placeholder = placeholder
    }
    
    func setTextFieldInputView(to view: UIView) {
        contentTextField.inputView = view
    }
    
    func setTextFieldText(to text: String) {
        contentTextField.text = text
    }
    
    func setAccesoryView(to view: UIToolbar) {
        contentTextField.inputAccessoryView = view
    }
    
}
