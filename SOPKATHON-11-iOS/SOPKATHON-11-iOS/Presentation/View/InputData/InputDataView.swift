//
//  InputDataView.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/20.
//

import UIKit

import SnapKit

final class InputDataView: BaseView {
    
    // MARK: - Variables

    // MARK: Constants

    // MARK: Property

    // MARK: Component
    
    private let buttonSetView = ButtonSetView()

    // MARK: - Function

    // MARK: LifeCycle

    // MARK: Server Helpers

    // MARK: Layout Helpers
    
    override func setLayout() {
        addSubviews(buttonSetView)
        buttonSetView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func setStyle() {
        backgroundColor = .white
    }

    // MARK: Custom Function

    // MARK: Objc Function


    // MARK: - extension

    // delegate 꼭 Extension 빼기, 마크 주석 달아주기!!
    // MARK: UICollectionViewDelegateFlowLayout

    // MARK: UICollectionViewDataSource
    
}
