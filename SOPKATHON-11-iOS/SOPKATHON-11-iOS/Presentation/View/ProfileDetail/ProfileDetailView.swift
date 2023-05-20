//
//  ProfileDetailView.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class ProfileDetailView: UIView {
    
    private let model : [ProfileDetail] = ProfileDetail.profileDummy()
    
    private let navigationBar = NavigationBarView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let profileImage = UIImageView()
    private let profileView = UIView()
    private let profileName = UILabel()
    private let lineView = UIView()
    private let profileAge = UILabel()
    
    private let profileMatchButton = UIButton()
    //let profileInfoTableView = UITableView()
    
    private let profileInfoLabel = UILabel()
    private let profileRegionTitle = UILabel()
    private let profileRegionText = UILabel()
    private let profileChildTitle = UILabel()
    private let profileChildText = UILabel()
    private let profileSingleTitle = UILabel()
    private let profileSingleText = UILabel()
    private let profileHobbyTitle = UILabel()
    private let profilePersonalityTitle = UILabel()
    private let profilePersonalityText = UILabel()
    
    private let lineView2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        setDelegate()
        
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileDetailView {
    func setUI() {
        backgroundColor = .white
        
        navigationBar.do {
            $0.backgroundColor = .white
            $0.setTitleBind(title: "천성우님의 프로필이에유")
        }
        profileImage.do {
            $0.image = UIImage(systemName: "house")
        }
        
        profileView.do {
            $0.backgroundColor = UIColor.white
        }
        
        profileName.do {
            $0.text = model[0].name
            $0.font = .boldSystemFont(ofSize: 28)
        }
        
        profileAge.do {
            $0.text = String(model[0].age) + "년생"
            $0.font = .systemFont(ofSize: 28)
        }
        
        lineView.do {
            $0.backgroundColor = .gray
        }
        
        profileMatchButton.do {
            $0.setImage(UIImage(systemName: "heart"), for: .normal)
            $0.setTitle("선택", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 24)
            $0.layer.cornerRadius = 24
            $0.setBorder(color: .systemPink, andWidth: 2)
        }
        
        profileInfoLabel.do {
            $0.text = "프로필 정보"
            $0.font = .boldSystemFont(ofSize: 20)
        }
        
        profileRegionTitle.do {
            $0.text = "지역"
            $0.font = .systemFont(ofSize: 18)
        }
        
        profileRegionText.do {
            $0.text = model[0].local
            $0.font = .systemFont(ofSize: 18)
        }
        
        profileChildTitle.do {
            $0.text = "자녀"
            $0.font = .systemFont(ofSize: 18)
        }
        
        profileChildText.do {
            $0.text = model[0].hasChild ? "해당 있음" : "해당 없음"
            $0.font = .systemFont(ofSize: 18)
        }
        
        profileSingleTitle.do {
            $0.text = "돌싱 여부"
            $0.font = .systemFont(ofSize: 18)
        }
        
        profileSingleText.do {
            $0.text = model[0].isMarried ? "있슈" : "없슈"
            $0.font = .systemFont(ofSize: 18)
        }
        
        lineView2.do {
            $0.backgroundColor = .lightGray
        }
        
        profileHobbyTitle.do {
            $0.text = "취미"
        }
        
    }
    
    func setHierarchy() {
        
        addSubviews(navigationBar, scrollView)
        
        scrollView.addSubview(contentView)
        
        [profileImage, profileView, profileName, lineView, profileAge, profileMatchButton, profileInfoLabel, profileRegionTitle, profileRegionText, profileChildTitle, profileChildText, profileSingleTitle, profileSingleText, lineView2,profileHobbyTitle].forEach {
            contentView.addSubview($0)
        }
        
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            // $0.edges.equalToSuperview()
            $0.height.equalTo(1200)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(355)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(-20)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(600)
        }
        
        profileName.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.top).offset(27)
            $0.leading.equalToSuperview().inset(87)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.top).offset(29)
            $0.leading.equalTo(profileName.snp.trailing).offset(8)
            $0.width.equalTo(1)
            $0.height.equalTo(30)
        }
        
        profileAge.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.top).offset(27)
            $0.trailing.equalToSuperview().inset(86)
        }
        
        profileMatchButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileName.snp.bottom).offset(20)
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
        
        profileInfoLabel.snp.makeConstraints {
            $0.top.equalTo(profileMatchButton.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileRegionTitle.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileRegionText.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalTo(profileRegionTitle.snp.trailing).offset(72)
        }
        
        profileChildTitle.snp.makeConstraints {
            $0.top.equalTo(profileRegionTitle.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileChildText.snp.makeConstraints {
            $0.top.equalTo(profileRegionTitle.snp.bottom).offset(11)
            $0.leading.equalTo(profileChildTitle.snp.trailing).offset(72)
        }
        
        profileSingleTitle.snp.makeConstraints {
            $0.top.equalTo(profileChildTitle.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileSingleText.snp.makeConstraints {
            $0.top.equalTo(profileChildTitle.snp.bottom).offset(11)
            $0.leading.equalTo(profileChildTitle.snp.trailing).offset(72)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(profileSingleTitle.snp.top).offset(50)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        profileHobbyTitle.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
    }
    
    func setDelegate() {
        
        
    }
}
