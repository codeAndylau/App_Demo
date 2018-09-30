//
//  RootNavigationViewController.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import RTRootNavigationController

class RootNavigationViewController: RTRootNavigationController {

    var currentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: LCAsset.common_gray_back.image, style: .plain, target: self, action: #selector(popVCAction))
            viewController.hidesBottomBarWhenPushed = true
        }
        // 这句super要写在后面，让viewController可以覆盖上面设置的leftBarButtonItem
        super.pushViewController(viewController, animated: animated)
    }

    @objc func popVCAction() {
        self.popViewController(animated: true)
    }

}

extension RootNavigationViewController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if navigationController.viewControllers.count == 1 {
            self.currentVC = nil
        }else{
            self.currentVC = viewController
        }
        
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.interactivePopGestureRecognizer {
            return self.currentVC == self.topViewController
        }
        return true
    }

}
