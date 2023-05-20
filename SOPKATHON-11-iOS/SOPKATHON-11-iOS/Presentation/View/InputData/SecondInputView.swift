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
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    
    lazy var hobbyCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.allowsMultipleSelection = true
        collectionView.register(BasicCell.self, forCellWithReuseIdentifier: BasicCell.identifier)
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    override func setLayout() {
//        addSubviews(buttonSetView)
//        buttonSetView.snp.makeConstraints {
//            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
//            $0.top.equalTo(safeAreaLayoutGuide)
//        }
//
//        addSubviews(hobbyCollectionView)
//        hobbyCollectionView.snp.makeConstraints {
//            $0.top.equalTo(buttonSetView.snp.bottom).offset(10)
//            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
//            $0.bottom.equalToSuperview()
//        }
    }
    
    override func setStyle() {
        backgroundColor = .white
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}
