//
//  UILabel+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/30.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

extension UILabel {
    
    
    /// 便利构造函数
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize 默认14号字
    ///   - color: color 默认为深灰色
    convenience init(title: String, fontSize: CGFloat = 14, color: UIColor = UIColor.darkGray) {
        self.init()
        text = title
        textColor = color
        font = UIFont.systemFont(ofSize: fontSize)
        numberOfLines = 0
        textAlignment = .center
    }
}
