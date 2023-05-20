//
//  MatchingViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/21.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class MatchingViewController: UIViewController {
    
    //    var matchingList: [Matching] = [] {
    //        didSet {
    //            //             변화가 있을 떄마다 reload 해주어서 변화값을 보여줌
    //            self.matchingCollectionView.reloadData()
    //        }
    //    }
    
    private let titleLabel = UILabel().then {
        $0.text = "여민서님을 선택한 분들이에요!"
        $0.font = .systemFont(ofSize: 18)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 0
        $0.layer.shadowOffset = CGSize(width: 1, height: 1)
        $0.layer.shadowOpacity = 0.11
        $0.layer.masksToBounds = false
    }
    
    private let matchingLabel = UILabel().then {
        $0.text = "매칭인원"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private var matchingCountLabel = UILabel().then {
        $0.text = "2명"
        $0.textColor = .gray
        $0.font = .boldSystemFont(ofSize: 20)
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
    //
    //    private func home() {
    //        HomeService.shared.home() { response in
    //            switch response {
    //            case .success(let data):
    //                guard let data = data as? Home else { return }
    //                self.matchingList.append(contentsOf: data.data)
    //
    //
    ////                data.data.forEach {
    //
    //
    ////                    let model = Model(id: $0.id, name: $0.name, age: $0.age, local: $0.local, url: $0.profileImage)
    //
    ////                    self.homeList.append(model)
    ////                }
    //
    //                print(self.matchingList)
    //            default:
    //                return
    //            }
    //        }
    //    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(
            titleLabel,
            matchingLabel,
            matchingCountLabel,
            matchingCollectionView)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(63)
            $0.centerX.equalToSuperview()
        }
        
        matchingLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
        }
        
        matchingCountLabel.snp.makeConstraints{
            $0.top.equalTo(matchingLabel)
            $0.leading.equalTo(matchingLabel.snp.trailing).offset(6)
        }
        
        matchingCollectionView.snp.makeConstraints{
            $0.top.equalTo(matchingLabel.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(83)
            $0.centerX.equalToSuperview()
        }
    }
}

extension MatchingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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
        guard let cell = matchingCollectionView.dequeueReusableCell(withReuseIdentifier: MatchingCollectionViewCell.matchingIdentifier, for: indexPath) as? MatchingCollectionViewCell else { return UICollectionViewCell() }
        switch indexPath.row {
        case 0:
            cell.nameLabel.text = HomeViewController().dummyList[0].name
            cell.bornLabel.text = String(HomeViewController().dummyList[0].age) + "년생"
            cell.profileImageView.kfSetImage(url: HomeViewController().dummyList[0].profileImage)
        case 1:
            cell.nameLabel.text = HomeViewController().dummyList[1].name
            cell.bornLabel.text = String(HomeViewController().dummyList[1].age) + "년생"
            cell.profileImageView.kfSetImage(url: HomeViewController().dummyList[1].profileImage)
        default:
            return cell
        }
        return cell
    }
        
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Click Cell Number:" + String(indexPath.item))
            let matchingListViewController = MatchingListViewController()
            
            self.navigationController?.pushViewController(matchingListViewController, animated: true)
            self.navigationController?.navigationBar.isHidden = true
            
        }
}
