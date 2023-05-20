//
//  MatchingListViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class MatchingListViewController: UIViewController {
    
    // MARK: - Components
    
    private let scrollView = UIScrollView().then {
        $0.isScrollEnabled = true
    }
    
    private let containerView = UIView()
    
    private let profileView = MatchingListView()
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(MissionListTableViewCell.self, forCellReuseIdentifier: "missionlistCell")
        $0.tableFooterView = UIView()
        $0.isScrollEnabled = false
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "미션리스트 5가지"
        $0.font = .semibold18
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("미션 더보기", for: .normal)
        $0.setTitleColor(.gray1, for: .normal)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    // MARK: - UI Setup
    
    func setUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(950) // ScrollView의 높이가 950이 되도록 설정
        }
        
        containerView.addSubviews(
            profileView,
            tableView,
            subTitleLabel,
            moreButton
        )
        
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(130)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(400)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(tableView.snp.top).offset(-13)
            $0.leading.equalTo(tableView.snp.leading)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
}


// MARK: UITableViewDataSource, UITableViewDelegate

extension MatchingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return  80
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionlistCell", for: indexPath) as! MissionListTableViewCell
        
        let mission = missionList[indexPath.row]
        cell.selectionStyle = .none
        cell.missionImage.image = UIImage(named: mission.missionIamge)
        cell.missionTitle.text = mission.missionName
        
        return cell
    }

}
