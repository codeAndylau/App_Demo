//
//  MainTabBarViewController.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MainTabBarViewController {
    
    func setupUI() {
        ApplicationService.navbarConfig()
        ApplicationService.tabbarConfig()
        //ApplicationService.tabbarAppearanceConfig(self.tabBar)
    }
    
}
