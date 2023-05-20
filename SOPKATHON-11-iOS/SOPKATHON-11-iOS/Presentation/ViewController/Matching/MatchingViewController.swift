//
//  MatchingViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/21.
//

import UIKit

class MatchingViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "마음에 드는 상대를 선택해보세요!"
    }
    
    lazy var matchingFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        
    }
    
    lazy var matchingCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: matchingFlowLayout).then{
        $0.register(MatchingCollectionViewCell.self, forCellWithReuseIdentifier: MatchingCollectionViewCell.matchingIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

extension MatchingViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(
            titleLabel,
            matchingCollectionView)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        matchingCollectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}

extension MatchingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 20) / 2, height: (UIScreen.main.bounds.width - 20) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = matchingCollectionView.dequeueReusableCell(withReuseIdentifier: MatchingCollectionViewCell.matchingIdentifier, for: indexPath) as? MatchingCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }

}
