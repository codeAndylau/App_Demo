//
//  UIColor+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

extension UIColor {
    
    // 便利初始化方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    static func hexColor(_ hexColor : Int64) -> UIColor {
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    /// 随机颜色
    static func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
}

// 常用颜色
let kTabbarColor = UIColor.hexColor(0xF0F2F5)
let kThemeWhiteColor = UIColor.hexColor(0xFFFFFF)
let kThemeTomatoColor = UIColor.hexColor(0xF7583B)
let kThemeBlackColor = UIColor.hexColor(0x000000)
let kThemeGreyColor = UIColor.hexColor(0xA9A9A9)
