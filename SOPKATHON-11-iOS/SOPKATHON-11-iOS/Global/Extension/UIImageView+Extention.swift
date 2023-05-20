//
//  UIImageView+Extention.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit
import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else {
            print(url)
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
