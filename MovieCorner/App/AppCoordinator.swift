//
//  AppCoordinator.swift
//  MovieCorner
//
//  Created by Aleksandar Simic on 11/28/17.
//  Copyright © 2017 Slick. All rights reserved.
//

import Foundation

final class AppCoordinator {
    
    func start() {
        let splashViewController = SplashViewController()
        Action.SwitchRootViewController(targetViewController: launchController, animated: false).perform()
        startServiceCoordinator()
    }
}
