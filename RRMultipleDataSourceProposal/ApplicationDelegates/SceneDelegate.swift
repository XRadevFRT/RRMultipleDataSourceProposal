//
//  SceneDelegate.swift
//  RRMultipleDataSourceProposal
//
//  Created by Radoslav Radev on 20.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let mainVC = MainViewController()
        let mainVM = MainViewModel()
        mainVC.viewModel = mainVM
        
        let navigationVC = UINavigationController(rootViewController: mainVC)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }
    
}
