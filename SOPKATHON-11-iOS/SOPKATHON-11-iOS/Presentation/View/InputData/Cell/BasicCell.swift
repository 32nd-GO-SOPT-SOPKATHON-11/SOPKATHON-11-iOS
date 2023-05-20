//
//  DynamicCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/20.
//

import UIKit

import SnapKit

final class BasicCell: UICollectionViewCell {
    
    // TODO: 앞으로 할 일을 TODO로 적어두기 -> 나중에 꼭 지우기
    
    // MARK: - Variables
    
    // MARK: Constants
    
    static let identifier = "DynamicCell"
    
    enum Size {
        static let fontSize: CGFloat = 14
        static let sidePadding: CGFloat = 10
    }
    
    // MARK: Property
    
    override var isSelected: Bool {
        didSet {
            toggleCell()
        }
    }
    
    
    
    // MARK: Component (button, label 등 코드로 만들때)
    
    private let cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Size.fontSize)
        label.textAlignment = .center
        // TODO: title 변경
        return label
    }()
    
    // MARK: - Function
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    
    private func setLayout() {
        addSubview(cellTitleLabel)
        cellTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(Size.sidePadding)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
    
    private func setStyle() {
        backgroundColor = .gray
    }

    // MARK: Custom Function
    
    func configureCell(_ string: String) {
        cellTitleLabel.text = string
    }
    
    func toggleCell() {
//        isSelected.toggle()
        backgroundColor = isSelected ? .black : .gray
    }
    

    // MARK: Objc Function


    // MARK: - extension

    // delegate 꼭 Extension 빼기, 마크 주석 달아주기!!
    // MARK: UICollectionViewDelegateFlowLayout

    // MARK: UICollectionViewDataSource
    
}
