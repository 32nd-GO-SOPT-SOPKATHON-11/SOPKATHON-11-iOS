//
//  SecondInputView.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class SecondInputView: BaseView {
    
    // MARK: - Property
    
    
    
    // MARK: - UI Property
    
    private let kidsButtonView: ButtonSetView = {
        let view = ButtonSetView()
        view.setButtonTitles("있음", "없음")
        return view
    }()
    
    private let hasBeenMarriedButtonView: ButtonSetView = {
        let view = ButtonSetView()
        view.setButtonTitles("해당", "없음")
        return view
    }()
    
    private let hobbyFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        
        return layout
    }()
    
    private let personalityFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        
        return layout
    }()
    
    lazy var hobbyCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: hobbyFlowLayout)
        collectionView.register(HobbyCollectionViewCell.self, forCellWithReuseIdentifier: HobbyCollectionViewCell.identifer)
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    lazy var personalityCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: personalityFlowLayout)
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(completeButton)
        completeButton.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(83)
        }
    }
    
    override func setStyle() {
        backgroundColor = .white
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}
