//
//  MatchingListViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/21.
//

import UIKit

class MatchingListViewController: UIViewController {
    
    // MARK: Component
    
    private let profileView = MatchingListView()
    
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(MissionListTableViewCell.self, forCellReuseIdentifier: "missionlistCell")
        $0.tableFooterView = UIView()
        $0.isScrollEnabled = false
    }
    
    private let moreButton = UIButton().then{
        $0.setTitle("미션 더보기", for: .normal)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUI(){
        view.addSubviews(
            profileView,
            tableView,
            moreButton
        )
        
        profileView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()

        }
        
        tableView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(130)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(400)
        }
        
        moreButton.snp.makeConstraints{
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

        cell.missionImage.image = UIImage(named: mission.missionIamge)
        cell.missionTitle.text = mission.missionName
        
        return cell
    }

}
