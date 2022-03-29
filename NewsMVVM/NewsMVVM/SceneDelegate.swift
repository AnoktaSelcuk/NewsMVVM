//
//  SceneDelegate.swift
//  NewsMVVM
//
//  Created by Alperen Selçuk on 22.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene         = windowScene
            window?.backgroundColor     = .systemRed
            window?.rootViewController  = createNavigationController(ViewController())
            window?.makeKeyAndVisible()
            
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        }
    
    fileprivate func createNavigationController(_ controller: UIViewController) -> UINavigationController {
        let nc = UINavigationController(rootViewController: controller)
        
        return nc
    }
}


