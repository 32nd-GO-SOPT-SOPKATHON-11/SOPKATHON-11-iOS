//
//  UIFont+Extension.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

extension UIFont {
    static func pretendardFont(_ weight: String, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Pretendard-" + weight, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static var semibold28: UIFont {
        return pretendardFont("SemiBold", ofSize: 28)
    }
    
    static var semibold22: UIFont {
        return pretendardFont("SemiBold", ofSize: 22)
    }
    
    static var semibold18: UIFont {
        return pretendardFont("SemiBold", ofSize: 18)
    }
    
    static var regular13: UIFont {
        return pretendardFont("Regular", ofSize: 13)
    }
    
    static var regular17: UIFont {
        return pretendardFont("Regular", ofSize: 17)
    }
    
    static var regular20: UIFont {
        return pretendardFont("Regular", ofSize: 20)
    }
    
    static var regular28: UIFont {
        return pretendardFont("Regular", ofSize: 28)
    }
    
}

