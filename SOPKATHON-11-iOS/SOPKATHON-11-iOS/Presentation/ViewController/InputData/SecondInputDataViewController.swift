//
//  SecondInputDataViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class SecondInputDataViewController: BaseViewController {
    
    // MARK: - Property
    
    let hobbyList: [String] = ["등산하기", "등산", "등산하", "testtestsets", "testset", "test"]
    
    let personalityList: [String] = ["활동적인", "지적인", "감성적인", "성실한", "솔직한", "사교적인"]
    
    // MARK: - UI Property
    
    let baseView = SecondInputView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    // MARK: - Setting
    
    private func setDelegate() {
        baseView.hobbyCollectionView.delegate = self
        baseView.hobbyCollectionView.dataSource = self
        
        baseView.personalityCollectionView.delegate = self
        baseView.personalityCollectionView.dataSource = self
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}


// MARK: UICollectionViewDataSource

extension SecondInputDataViewController: UICollectionViewDelegate {}


// MARK: UICollectionViewDataSource

extension SecondInputDataViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == baseView.hobbyCollectionView {
            return hobbyList.count
        } else if collectionView == baseView.personalityCollectionView {
            return personalityList.count
        } else {   
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HobbyCollectionViewCell.identifier, for: indexPath) as? HobbyCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(hobbyList[indexPath.row])
        return cell
    }
    
}
