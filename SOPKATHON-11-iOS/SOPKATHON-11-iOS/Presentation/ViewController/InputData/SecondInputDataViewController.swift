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
    
    // MARK: - UI Property
    
    
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}


// MARK: UICollectionViewDataSource

extension SecondInputDataViewController: UICollectionViewDelegate {}


// MARK: UICollectionViewDataSource

extension SecondInputDataViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hobbyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicCell.identifier, for: indexPath) as? BasicCell
        else { return UICollectionViewCell() }
        cell.configureCell(hobbyList[indexPath.row])
        return cell
    }
    
}
