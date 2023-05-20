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
    
    // MARK: - Methods

    private func setStyle() {
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        /// tintColor, selected Color set
        /// unselectedItemTintColor, unselected Color set
    }

    private func setViewController() {

        let homeViewController = ViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "mic"), tag: 0)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.setNavigationBarHidden(true, animated: true)

        let matchinglistViewController = UIViewController()
        matchinglistViewController.view.backgroundColor = .gray
        matchinglistViewController.tabBarItem = UITabBarItem(title: "루틴추천", image: UIImage(systemName: "mic.fill"), tag: 1)
        let matchinglistNavigationController = UINavigationController(rootViewController: matchinglistViewController)



        viewControllers = [homeNavigationController,
                           matchinglistNavigationController]
        }
    
    private func hiddenNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
