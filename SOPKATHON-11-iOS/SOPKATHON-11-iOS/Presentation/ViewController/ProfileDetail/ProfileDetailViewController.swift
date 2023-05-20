//
//  ProfileDetailViewController.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/21.
//

import UIKit

import Then
import SnapKit

class ProfileDetailViewController: UIViewController {
    
    private let originView = ProfileDetailView()
    
    override func loadView() {
        self.view = originView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


