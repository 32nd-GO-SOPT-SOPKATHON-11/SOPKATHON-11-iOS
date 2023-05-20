//
//  UIViewController+Extension.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

extension UIViewController {
    
    func makeNavigationBarButton<T: UIView>(with view: T) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
    
    func makeNavigationBarItemArea(with button: UIButton) -> UIView {
        let offsetView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        offsetView.addSubview(button)
        return offsetView
    }
    
    /// 화면 터치시 작성 종료하는 메서드
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// 화면 터치시 키보드 내리는 메서드
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func makeAlert(title: String,
                   message: String? = nil,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func makeActionSheet(title: String? = nil,
                         message: String? = nil,
                         actionTitles:[String?],
                         actionStyle:[UIAlertAction.Style],
                         actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
