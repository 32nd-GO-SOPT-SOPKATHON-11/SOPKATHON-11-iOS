//
//  NavigationBarViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/20.
//

import UIKit

class NavigationBarViewController: UIViewController {
    
    private let navigationView = NavigationBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
    }
    

}

extension NavigationBarViewController {
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {
        view.addSubview(navigationView)
    }
    
    func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}
