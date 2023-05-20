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
    
    private let navigation = NavigationBarView()
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let progressBarView = UIImageView(image: ImageLiteral.progressbar2)
    
    private let characterView = UIImageView(image: ImageLiteral.character)
    
    private let kidsLabel: UILabel = {
        let label = UILabel()
        label.text = "자녀 유무"
        return label
    }()
    
    private let kidsButtonView: ButtonSetView = {
        let view = ButtonSetView()
        view.setButtonTitles("있음", "없음")
        return view
    }()
    
    private let hasBeenMarriedLabel: UILabel = {
        let label = UILabel()
        label.text = "돌싱 여부"
        return label
    }()
    
    private let hasBeenMarriedButtonView: ButtonSetView = {
        let view = ButtonSetView()
        view.setButtonTitles("해당", "없음")
        return view
    }()
    
    private let hobbyLabel: UILabel = {
        let label = UILabel()
        label.text = "취미"
        return label
    }()
    
    private let personalityLabel: UILabel = {
        let label = UILabel()
        label.text = "성격"
        return label
    }()
    
    private let hobbyFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 105, height: 105)
        return layout
    }()
    
    private let personalityFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 105, height: 38)
        return layout
    }()
    
    lazy var hobbyCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: hobbyFlowLayout)
        collectionView.register(HobbyCollectionViewCell.self, forCellWithReuseIdentifier: HobbyCollectionViewCell.identifier)
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    lazy var personalityCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: personalityFlowLayout)
        collectionView.register(PersonalityCollectionViewCell.self, forCellWithReuseIdentifier: PersonalityCollectionViewCell.identifier)
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.backgroundColor = .darkBrown1
        return button
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubviews(navigation)
        navigation.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigation.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.greaterThanOrEqualTo(snp.height).priority(.low)
//            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        contentView.addSubview(progressBarView)
        progressBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        contentView.addSubview(characterView)
        characterView.snp.makeConstraints {
            $0.centerY.equalTo(progressBarView)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(90)
        }
        
        contentView.addSubview(kidsLabel)
        kidsLabel.snp.makeConstraints {
            $0.top.equalTo(progressBarView.snp.bottom).offset(54)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(kidsButtonView)
        kidsButtonView.snp.makeConstraints {
            $0.top.equalTo(kidsLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(hasBeenMarriedLabel)
        hasBeenMarriedLabel.snp.makeConstraints {
            $0.top.equalTo(kidsButtonView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(hasBeenMarriedButtonView)
        hasBeenMarriedButtonView.snp.makeConstraints {
            $0.top.equalTo(hasBeenMarriedLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(hobbyLabel)
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(hasBeenMarriedButtonView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(hobbyCollectionView)
        hobbyCollectionView.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(220)
        }
        
        contentView.addSubview(personalityLabel)
        personalityLabel.snp.makeConstraints {
            $0.top.equalTo(hobbyCollectionView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(personalityCollectionView)
        personalityCollectionView.snp.makeConstraints {
            $0.top.equalTo(personalityLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(completeButton)
        completeButton.snp.makeConstraints {
            $0.top.equalTo(personalityCollectionView.snp.bottom).offset(36)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(83)
            $0.bottom.equalToSuperview().offset(42)
        }
        
    }
    
    override func setStyle() {
        backgroundColor = .darkBrown1
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}
