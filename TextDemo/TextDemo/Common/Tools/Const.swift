//
//  ConstTools.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import Foundation

let kScreenH = UIScreen.main.bounds.height
let kScreenW = UIScreen.main.bounds.width
let kScreenS = UIScreen.main.currentMode?.size

let IS_IPhone_6      = (kScreenH == 667 && kScreenW == 375) ? true : false  // 678  系列
let IS_IPhone_6p     = (kScreenH == 736 && kScreenW == 414) ? true : false  // 678p 系列
let IS_IPhone_X      = (kScreenS == CGSize(width: 1125, height: 2436)) ? true : false
let IS_IPhone_Xr     = (kScreenS == CGSize(width: 828, height: 1792))  ? true : false
let IS_IPhone_Xs     = (kScreenS == CGSize(width: 1125, height: 2436)) ? true : false
let IS_IPhone_Xs_Max = (kScreenS == CGSize(width: 1242, height: 2688)) ? true : false

let IS_IPhone_X_ALL    = (IS_IPhone_X == true || IS_IPhone_Xr == true || IS_IPhone_Xs == true || IS_IPhone_Xs_Max == true) // 表示iPhoneX系列的手机

let kStaBarH: CGFloat = IS_IPhone_X_ALL ? 44.0 : 20.0
let kNavBarH: CGFloat = IS_IPhone_X_ALL ? 88.0 : 64.0
let kTabBarH: CGFloat = IS_IPhone_X_ALL ? 83.0 : 49.0


