//
//  HomeViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "누가 마음에 쏙\n들어왔슈?"
        let font = UIFont.boldSystemFont(ofSize: 26)
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 26)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 0
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowOpacity = 0.11
        $0.layer.masksToBounds = false
    }
    
    lazy var logoImage = UIImageView().then {
        $0.image = UIImage(systemName: "figure.fall.circle.fill")
    }
    
    lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    lazy var homeCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: flowLayout).then{
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.homeIdentifier)
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

extension HomeViewController {
    private func setStyle() {
        view.backgroundColor = .white
        
        
        guard let text = self.titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let font = UIFont.boldSystemFont(ofSize: 26)
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "쏙"))
        self.titleLabel.attributedText = attributeString
    }
    
    private func setLayout() {
        view.addSubviews(
            titleLabel,
            logoImage,
            homeCollectionView)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(64)
            $0.leading.equalToSuperview().offset(20)
        }
        
        logoImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.height.width.equalTo(90)
            $0.trailing.equalToSuperview().inset(22)
        }
        
        homeCollectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(83)
            $0.centerX.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 162, height: 254)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.homeIdentifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Click Cell Number:" + String(indexPath.item))
    }
}
