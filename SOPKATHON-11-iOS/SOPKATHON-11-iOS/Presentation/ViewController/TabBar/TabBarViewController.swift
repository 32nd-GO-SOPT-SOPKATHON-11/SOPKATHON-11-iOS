//
//  TabBarViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class TabBarViewController: UITabBarController{
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hiddenNavigationBar()
    }
    
    // MARK: - Function

    private func setStyle() {
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .pink1
        self.tabBar.unselectedItemTintColor = .gray
        /// tintColor, selected Color set
        /// unselectedItemTintColor, unselected Color set
    }

    private func setViewController() {

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.setNavigationBarHidden(true, animated: true)

//        let matchinglistViewController = MatchingListViewController()
//        matchinglistViewController.view.backgroundColor = .gray
        
        let matchinglistViewController = MatchingViewController()
        matchinglistViewController.view.backgroundColor = .white
        matchinglistViewController.tabBarItem = UITabBarItem(title: "매칭 리스트", image: UIImage(systemName: "heart.fill"), tag: 1)
        let matchinglistNavigationController = UINavigationController(rootViewController: matchinglistViewController)

        viewControllers = [homeNavigationController,
                           matchinglistNavigationController]
        }
    
    private func hiddenNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
