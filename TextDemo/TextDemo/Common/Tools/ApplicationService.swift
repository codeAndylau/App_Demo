//
//  ApplicationService.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import UIKit

class ApplicationService: NSObject {
    
    /// 全局navbar配置
    class func navbarConfig() {
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.gray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        // UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    class func navbarAppearanceConfig(_ navbar: UINavigationBar) {
        navbar.layer.shadowColor = kThemeGreyColor.cgColor
        navbar.layer.shadowOpacity = 0.5
        navbar.layer.shadowOffset = CGSize(width: 0, height: -1)
        navbar.layer.shadowRadius = 3
    }
    
    /// 全局barbar配置
    class func tabbarConfig() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = kThemeWhiteColor
        UITabBar.appearance().tintColor = kThemeTomatoColor
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : kThemeBlackColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : kThemeTomatoColor], for: .selected)
    }
    
    class func tabbarAppearanceConfig(_ tabBar: UITabBar) {
        tabBar.layer.shadowColor = kThemeGreyColor.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 3
    }
    
    class func setStaticGuidePage(_ window: UIWindow) {
        
        guard isFirstLaunch() == false else {
            return
        }
        
        let imageNameArray: [String] = ["lead01", "lead02", "lead03"]
        let guideView = GuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        window.rootViewController?.view.addSubview(guideView)
    }

    /// 判断是否是应用第一次启动
    class func isFirstLaunch() -> Bool {
        let hasBeenLaunched = "hasBeenLaunched"
        let isFirstLaunch = UserDefaults.standard.bool(forKey: hasBeenLaunched)
        if !isFirstLaunch {
            UserDefaults.standard.set(true, forKey: hasBeenLaunched)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
    
    /// 判断是否有版本更新
    class func isNewVersion() -> Bool {
        
        // 1.当前的版本号
        let currentVersion = App.appVersion
        let current = Double(currentVersion)!
        
        // 2. 之前的版本号 把当前的版本保存在用户偏好 如果key不存在则返回0
        let sandboxVersionKey = "sandboxVersionKey"
        let sandboxVersion = UserDefaults.standard.double(forKey: sandboxVersionKey)
        
        // 3. 保存当前的版本
        UserDefaults.standard.set(current, forKey: sandboxVersionKey)

        return current > sandboxVersion
    }
    
}
