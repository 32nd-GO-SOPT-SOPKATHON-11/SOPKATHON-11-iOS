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
    
    let hobbyList: [String] = ["운동", "독서", "미술", "악기", "노래", "춤"]
    let hobbyImageList: [UIImage] = [ImageLiteral.hobby1, ImageLiteral.hobby2, ImageLiteral.hobby3, ImageLiteral.hobby4, ImageLiteral.hobby5, ImageLiteral.hobby6]
    
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
        }
        if collectionView == baseView.personalityCollectionView {
            return personalityList.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == baseView.hobbyCollectionView {
            guard let hobbyCell = collectionView.dequeueReusableCell(withReuseIdentifier: HobbyCollectionViewCell.identifier, for: indexPath) as? HobbyCollectionViewCell
            else { return UICollectionViewCell() }
            hobbyCell.configureCell(with: hobbyImageList[indexPath.row], and: hobbyList[indexPath.row] )
            return hobbyCell
        } else if collectionView == baseView.personalityCollectionView {
            print(#function)
            guard let personalityCell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalityCollectionViewCell.identifier, for: indexPath) as? PersonalityCollectionViewCell
            else { return UICollectionViewCell() }
            personalityCell.configureCell(with: personalityList[indexPath.row])
            return personalityCell
        } else { return UICollectionViewCell() }
    }
    
}
