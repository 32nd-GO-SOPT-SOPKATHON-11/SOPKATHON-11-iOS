//
//  HobbyCollectionViewCell.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

import SnapKit

final class HobbyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "HobbyCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            toggleCell()
        }
    }
    
    // MARK: - UI Property
    
    private let hobbyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let hobbyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .regular17
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(hobbyImageView)
        hobbyImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(hobbyLabel)
        hobbyLabel.snp.makeConstraints {
            $0.center.equalTo(hobbyImageView)
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    func configureCell(with image: UIImage, and title: String) {
        hobbyImageView.image = image
        hobbyLabel.text = title
    }
    
    private func toggleCell() {
        if isSelected {
            hobbyLabel.textColor = .pink1
        } else {
            hobbyLabel.textColor = .white
        }
    }
    
}
