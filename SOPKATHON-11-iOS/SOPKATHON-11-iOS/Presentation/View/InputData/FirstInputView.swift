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
    
    private enum Size {
        static let sidePadding = 20
        static let componentSpacing = 25
    }
    
    // MARK: - UI Property
    
    private let profileImageButton: UIButton = {
        let button = UIButton()
        button.setCornerRadius(to: 76)
        button.setImage(UIImage(named: "person"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .black
        return button
    }()
    
    private let nameTextFieldView: TextfieldWithLabelView = {
        let view = TextfieldWithLabelView()
        view.setTitleLableText(to: "이름")
        view.setTextFieldPlaceholder(to: "이름을 입력해주세요")
        return view
    }()
    
    private let birthYearTextFieldView: TextfieldWithLabelView = {
        let view = TextfieldWithLabelView()
        view.setTitleLableText(to: "출생 연도")
        view.setTextFieldPlaceholder(to: "예시) 58년생")
        return view
    }()
    
    private let genderSelectionLabel: UILabel = {
        let label = UILabel()
        label.text = "성별"
        return label
    }()
    
    private let genderSelectionButtonView: ButtonSetView = {
        let buttonView = ButtonSetView()
        buttonView.setButtonTitles("남자", "여자")
        return buttonView
    }()
    
    private lazy var regionPickerTextFieldView: TextfieldWithLabelView = {
        let view = TextfieldWithLabelView()
        view.setTitleLableText(to: "거주 지역")
        view.setTextFieldPlaceholder(to: "지역을 선택해주세요")
        view.setTextFieldInputView(to: regionPickerView)
        return view
    }()
    
    let regionPickerView = UIPickerView()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .gray
        // TODO: action 추가
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setToolBar()
    }
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(profileImageButton)
        profileImageButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(113)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(152)
        }
        
        addSubview(nameTextFieldView)
        nameTextFieldView.snp.makeConstraints {
            $0.top.equalTo(profileImageButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
        }
        
        addSubview(birthYearTextFieldView)
        birthYearTextFieldView.snp.makeConstraints {
            $0.top.equalTo(nameTextFieldView.snp.bottom).offset(Size.componentSpacing)
            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
        }
        
        addSubview(genderSelectionLabel)
        genderSelectionLabel.snp.makeConstraints {
            $0.top.equalTo(birthYearTextFieldView.snp.bottom).offset(Size.componentSpacing)
            $0.leading.equalToSuperview().inset(Size.sidePadding)
        }
        
        addSubview(genderSelectionButtonView)
        genderSelectionButtonView.snp.makeConstraints {
            $0.top.equalTo(genderSelectionLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
        }
        
        addSubview(regionPickerTextFieldView)
        regionPickerTextFieldView.snp.makeConstraints {
            $0.top.equalTo(genderSelectionButtonView.snp.bottom).offset(Size.componentSpacing)
            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(83)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Action Helper
    
    @objc
    private func didTapCompleteButton() {
        endEditing(true)
    }
    
    // MARK: - Custom Method
    
    func configureImageView(image: UIImage) {
        profileImageButton.setImage(image, for: .normal)
    }
    
    func addImageViewAction(_ action: UIAction) {
        profileImageButton.addAction(action, for: .touchUpInside)
    }
    
    func configRegion(to region: String) {
        regionPickerTextFieldView.setTextFieldText(to: region)
    }
    
    func setToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 44))
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(didTapCompleteButton))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), button], animated: true)
        regionPickerTextFieldView.setAccesoryView(to: toolBar)
    }
    
}
