//
//  UILabel+Extension.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

extension UILabel {
    
    // UILabel의 일부 text 색상을 바꿔주는 함수
    // targetString의 text를 color로 바꿔줌
    func asColor(targetString: String, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
    
    ///text line height 추가
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat){
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
    }
    
    /// label에 밑줄 추가
    func underlineText() {
        guard let labelText = text else { return }
        
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
    
    /// 자간 추가
    func addLetterSpacing(_ value: Double) {
        let kernValue = self.font.pointSize * CGFloat(value)
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
    
}
