//
//  HomeViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/20.
//

import UIKit

import SnapKit
import Then
import Kingfisher

struct Model {
    let id: Int
    let name: String
    let age: Int
    let local: String
    let url: String
}

final class HomeViewController: UIViewController {
    
    var homeList: [Model] = [] {
        didSet {
            //             변화가 있을 떄마다 reload 해주어서 변화값을 보여줌
            self.homeCollectionView.reloadData()
        }
    }
    
    let dummyList = [SOPKATHON_11_iOS.Datum(id: 2, name: "이영수", age: 1954, local: "서울", profileImage: "https://storage.googleapis.com/ive-server/common-3.jpeg"), SOPKATHON_11_iOS.Datum(id: 3, name: "석상언", age: 1950, local: "인천", profileImage: "https://storage.googleapis.com/ive-server/common-4.jpeg"), SOPKATHON_11_iOS.Datum(id: 4, name: "임연수", age: 1958, local: "충청도", profileImage: "https://storage.googleapis.com/ive-server/Untitled-2.png"), SOPKATHON_11_iOS.Datum(id: 5, name: "홍경진", age: 1965, local: "강원도", profileImage: "https://storage.googleapis.com/ive-server/Untitled-3.png"), SOPKATHON_11_iOS.Datum(id: 6, name: "강영호", age: 1963, local: "세종", profileImage: "https://storage.googleapis.com/ive-server/Untitled-4.png"), SOPKATHON_11_iOS.Datum(id: 7, name: "최영수", age: 1951, local: "경산", profileImage: "https://storage.googleapis.com/ive-server/Untitled-5.png"), SOPKATHON_11_iOS.Datum(id: 8, name: "김성근", age: 1963, local: "광주", profileImage: "https://storage.googleapis.com/ive-server/Untitled-6.png")]
    
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
        $0.image = ImageLiteral.characterReversed
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 0.17
        $0.layer.masksToBounds = false
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
        home()
//        print(dummyList[0].name)
    }
}

extension HomeViewController {
    
    private func home() {
        HomeService.shared.home() { response in
            switch response {
            case .success(let data):
                guard let data = data as? Home else { return }
//                self.homeList.append(contentsOf: data.data)
                
                
                data.data.forEach {
                
                    
                    let model = Model(id: $0.id, name: $0.name, age: $0.age, local: $0.local, url: $0.profileImage)
                    
                    self.homeList.append(model)
                }
       
//                print(self.homeList)
            default:
                return
            }
        }
    }
    
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
        return 7
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
//        cell.configureHomeCell(indexPath.item)
//        cell.nameLabel.text = self.homeList[1].name
        
//        cell.nameLabel.text = self.homeList[indexPath.row].name
        
        cell.nameLabel.text = self.dummyList[indexPath.row].name
        cell.bornLabel.text = String(self.dummyList[indexPath.row].age) + "년생"
        cell.profileImageView.kfSetImage(url: self.dummyList[indexPath.row].profileImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Click Cell Number:" + String(indexPath.item))
        
//        let profileDetailViewController = ProfileDetailViewController()
        
//        self.navigationController?.pushViewController(profileDetailViewController, animated: true)
    }
}
