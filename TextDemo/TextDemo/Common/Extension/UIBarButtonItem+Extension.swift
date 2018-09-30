//
//  UIBarButtonItem+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

/*
 1. 条件判断，条件不满足，即可返回nil
 2. 简化对象的创建
 3. 不负责属性的创建和初始化，必须调用自己指定的的init构造方法
 */

extension UIBarButtonItem {
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero)  {
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: UIControl.State())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        // 4.创建UIBarButtonItem
        self.init(customView : btn)
    }
    
    convenience init(title: String, fontSize: CGFloat = 15, target: AnyObject?, action: Selector) {
        // 1.创建UIButton
        let btn = UIButton()
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
    
    
}

extension UIBarButtonItem {
    
    /// 字体+target+action
    ///
    /// - Parameters:
    ///   - hq_title: title
    ///   - fontSize: fontSize
    ///   - target: target
    ///   - action: action
    ///   - isBack: 是否是返回按钮,如果是就加上箭头的`icon`
//    convenience init(hq_title: String, fontSize: CGFloat = 16, target: Any?, action: Selector, isBack: Bool = false) {
//
//        let btn = UIButton(hq_title: hq_title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//
//        if isBack {
//            let imageName = "nav_back"
//            btn.setImage(UIImage.init(named: imageName), for: .normal)
//            btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
//            btn.sizeToFit()
//        }
//
//        btn.addTarget(target, action: action, for: .touchUpInside)
//        // self.init 实例化 UIBarButtonItem
//        self.init(customView: btn)
//    }

}
