//
//  SplashViewController.swift
//  MovieCorner
//
//  Created by Aleksandar Simic on 11/12/17.
//  Copyright © 2017 Slick. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
}

//MARK: UI

extension SplashViewController {
    
    fileprivate func setupUi() {
        self.view.backgroundColor = .pitchBlack
        setupTitle()
    }
    
    private func setupTitle() {
        let title = UILabel()
        title.textColor = .white
        title.text = Configuration.instance.appName.uppercased()
        self.view.addSubview(title)
    }
}
