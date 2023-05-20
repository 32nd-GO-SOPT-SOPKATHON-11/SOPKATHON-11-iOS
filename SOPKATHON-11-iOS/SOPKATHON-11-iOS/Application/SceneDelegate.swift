//
//  SceneDelegate.swift
//  SOPKATHON-11-iOS
//
//  Created by 천성우 on 2023/05/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        // MARK: - 1. 현재의 scene이 UIWindowScene인지 확인.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: - 2. 앱 내부에서 사용할 UIWindow를 생성한다. 이는 이후 앱의 뷰 계층 구조를 관리하는데 사용할 수 있다.
        self.window = UIWindow(windowScene: windowScene)
        
        // MARK: - 3. 이 과정에서 생성된 UINavigationController는 앱 뷰 컨트롤러를 관리하는 데 사용되며 rootViewController는 앱의 뷰 계층 구조에서 최상위 view 컨드롤러 입니다.
        
        let navigationController = UINavigationController(rootViewController: FirstInputDataViewController())
        self.window?.rootViewController = navigationController
        
        // MARK: - 4. UIWindow를 화면에 표시하도록 설정하는 것.
        self.window?.makeKeyAndVisible()
    }
}
