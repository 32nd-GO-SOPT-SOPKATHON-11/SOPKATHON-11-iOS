//
//  ImageLiteral.swift
//  SOPKATHON-11-iOS
//
//  Created by 이성민 on 2023/05/21.
//

import UIKit

enum ImageLiteral {
    static let character = UIImage.load(name: "character")
    static let characterReversed = UIImage.load(name: "characterReversed")
    
    static let connect = UIImage.load(name: "connect")
    static let connectFilled = UIImage.load(name: "connectFilled")
    static let defaultImage = UIImage.load(name: "defaultImage")
    static let heartPink = UIImage.load(name: "heartPink")
    static let heartWhite = UIImage.load(name: "heartWhite")
    static let hobby1 = UIImage.load(name: "hobby1")
    static let hobby2 = UIImage.load(name: "hobby2")
    static let hobby3 = UIImage.load(name: "hobby3")
    static let hobby4 = UIImage.load(name: "hobby4")
    static let hobby5 = UIImage.load(name: "hobby5")
    static let hobby6 = UIImage.load(name: "hobby6")
    static let home = UIImage.load(name: "home")
    static let homeFilled = UIImage.load(name: "homeFilled")
    static let profile = UIImage.load(name: "profile")
    static let progressbar1 = UIImage.load(name: "progressbar1")
    static let progressbar2 = UIImage.load(name: "progressbar2")
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            print("Image load failed: \(name)")
            return UIImage()
        }
        return image
    }
}
