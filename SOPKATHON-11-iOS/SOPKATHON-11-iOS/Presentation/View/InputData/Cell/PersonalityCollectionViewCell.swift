//
//  PersonalityCollectionViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class PersonalityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "PersonalityCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            toggleCell()
        }
    }
    
    // MARK: - UI Property
    
    private let hobbyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray1
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        contentView.addSubview(hobbyTitleLabel)
        hobbyTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setStyle() {
        setCornerRadius(to: 17)
        setBorder(color: .init(hex: "#F4F4F4"), andWidth: 1)
    }
    
    // MARK: - Custom Method
    
    func configureCell(with text: String) {
        hobbyTitleLabel.text = text
    }
    
    func toggleCell() {
        contentView.backgroundColor = isSelected ? .pink1 : .white
        hobbyTitleLabel.textColor = isSelected ? .white : .gray1
//        print(isSelected)
    }
    
}
