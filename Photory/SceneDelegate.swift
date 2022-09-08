//
//  SceneDelegate.swift
//  Photory
//
//  Created by Hamlit Jason on 2022/08/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("\(#function)")
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UIHostingController(rootView: HomeView())
        window?.makeKeyAndVisible()
    }

}

