//
//  ViewController.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import SVProgressHUD
import MBProgressHUD

class ViewController: UIViewController {
    
    
    var imgView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printLog("iOS 开发")
        
        let arr = [1,1,22,3,5,33]
        printLog("返回数组的随机元素---\(arr.sample ?? 0)")
        
        
    }

    @IBAction func btn1Action(_ sender: UIButton) {
        
//        ProgressHUD.lc_showWithStatus("刘德华。。。。")
//        ProgressHUD.lc_showErrorWithStatus("网络错误...")
//        ProgressHUD.lc_showSuccessWithStatus("数据请求成功...")
//        ProgressHUD.lc_showWarningWithStatus("牛皮哦小伙子...")
//        delay(by: 3) {
//            ProgressHUD.lc_dismiss()
//        }
        
//       MBProgressHUD.showTitle(text: "刘德华。。。")
//
//        delay(by: 3) {
//            MBProgressHUD.hideHUD()
//        }
        
        let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        let app = UIApplication.shared.delegate as! AppDelegate
        
        app.window?.rootViewController = rootVC
    }
    
}

