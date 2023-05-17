//
//  UIView+Extension.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

extension UIView {
    
    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor, andWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    func makeRounded(radius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
}
