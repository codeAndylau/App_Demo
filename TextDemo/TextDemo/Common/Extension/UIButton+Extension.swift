//
//  UIButton+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/30.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, color: UIColor, imageName: String) {
        self.init()
         setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setBackgroundImage(UIImage(named: imageName), for: .normal)
        sizeToFit()
    }
    
}
