//
//  ProgresssHUD.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import SVProgressHUD
import MBProgressHUD

extension MBProgressHUD {
    
    /// 只显示菊花状态
    class func show() {
        _ = self.showAdded(to: viewToShow(), animated: true)
    }
    
    /// 只显示纯文本
    class func showTitle(text title: String) {
        let hud = self.showAdded(to: viewToShow(), animated: true)
        hud.mode = .text
        hud.label.text = title
    }
    
    /// 现实标题和详情
    class func showTitleWithDetail(text title: String, detail: String) {
        let hud = self.showAdded(to: viewToShow(), animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = detail
    }
    
    /// 现实菊花+文字标题
    class func showLoadingWithTitle(text title: String) {
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.label.text = title
    }
    
    //显示等待消息
    class func showWait(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    //显示普通消息
    class func showInfo(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "info")!) //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    //显示成功消息
    class func showSuccess(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "tick")!) //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //显示失败消息
    class func showError(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "cross")!) //自定义视图显示图片
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    //获取用于显示提示框的view
    class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindow.Level.normal {
                    window = tempWin;
                    break
                }
            }
        }
        return window!
    }
    
    // MARK: 第二种现实方式
    // 显示文字
    class func show(text: String, view: UIView?, _ time: TimeInterval = 1.5) {
        DispatchQueue.main.async {
            var currentView = view
            if view == nil {
                currentView = viewToShow()
            }
            let hud = MBProgressHUD.showAdded(to: currentView!, animated: true)
            hud.label.text = text
            hud.bezelView.color = .black
            hud.mode = .customView
            hud.removeFromSuperViewOnHide = true
            hud.label.textColor = UIColor(white: 1, alpha: 0.6)
            hud.hide(animated: true, afterDelay: time)
        }
    }
    
    // 隐藏文字
    class func hide(forView: UIView?, animated: Bool) {
        DispatchQueue.main.async {
            var currentView = forView
            if currentView == nil {
                currentView = viewToShow()
            }
            MBProgressHUD.hide(for: currentView!, animated: animated)
        }
    }
    
    /// 只显示菊花
    class func showLoadHud() {
        MBProgressHUD.hideHUD()
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .indeterminate
    }
    
    /// 显示菊花+文字
    class func showLoadHUDMsg(_ message: String) {
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.label.text = message
        
        //方框背景颜色(也可直接在MBProgressHUD.m的1111行修改)
        //hud.bezelView = UIColor.orange
        
    }
    
    /// 显示文字-->几秒钟后消失
    class func showHUDMsg(_ message: String) {
        
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.hide(animated: true, afterDelay: 1.5)
        
        //可以设置显示的位置
        // hud.offset = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
    }
    
    /// 环形进度条+文字
    class func showCircularHUDProgress(_ message: String) {
        
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .annularDeterminate
        hud.mode = .determinate
        hud.label.text = message
    }
    
    /// 水平进度条 + 文字
    class func showBarHUDProgress(_ message: String) {
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .determinateHorizontalBar
        hud.mode = .determinate
        hud.label.text = message
    }
    
    /// 更新进度条
    class func updateHUDProgress() -> MBProgressHUD {
        return MBProgressHUD.init(for: viewToShow())!
    }
    
    /// 自定义图片 + 文字
    class func showCustomViewHUD(_ message: String, _ imgName: String) {
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .customView
        
        // 设置显示的图片
        let image = UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
        hud.customView = UIImageView(image: image)
        hud.label.text = message
        hud.isSquare = true
        hud.hide(animated: true, afterDelay: 2.0)
    }
    
    /// 自定义加载动画 + 文字
    class func showCustomGifHUD(_ message: String, imgName: String) {
        
        MBProgressHUD.hideHUD()
        
        let hud = MBProgressHUD.showAdded(to: viewToShow(), animated: true)
        hud.mode = .customView
        hud.label.text = message
        
        // 设置显示的图片
        let image = UIImage(named: imgName) //?.withRenderingMode(.alwaysTemplate)
        hud.customView = UIImageView(image: image)
        
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.toValue = Double.pi * 2.0
        anim.duration = 0.5
        anim.isCumulative = true
        anim.repeatCount = 20000 // 重复次数
        hud.customView?.layer.add(anim, forKey: "rotationAnimation")
        
        hud.bezelView.color = UIColor.white
        hud.bezelView.layer.cornerRadius = 50
        
    }
    
    /// 隐藏HUD
    class func hideHUD() {
        MBProgressHUD.hide(for: viewToShow(), animated: true)
    }
}


class ProgressHUD: NSObject {
    
    class func lc_initHUD() {
        SVProgressHUD.setBackgroundColor(UIColor.black.withAlphaComponent(0.5))
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14))
        SVProgressHUD.setDefaultMaskType(.none)
    }
    
    //成功
    class func lc_showSuccessWithStatus(_ string: String) {
        self.ProgressHudShow(.success, status: string)
    }
    
    //失败 ，NSError
    class func lc_showErrorWithObject(_ error: NSError) {
        self.ProgressHudShow(.errorObject, status: nil, error: error)
    }
    
    //失败，String
    class func lc_showErrorWithStatus(_ string: String) {
        self.ProgressHudShow(.errorString, status: string)
    }
    
    //转菊花
    class func lc_showWithStatus(_ string: String) {
        self.ProgressHudShow(.loading, status: string)
    }
    
    //警告
    class func lc_showWarningWithStatus(_ string: String) {
        self.ProgressHudShow(.info, status: string)
    }
    
    //dismiss消失
    class func lc_dismiss() {
        SVProgressHUD.dismiss()
    }
    
    fileprivate class func ProgressHudShow(_ type: HUDType, status: String? = nil, error: NSError? = nil) {
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
            break
        case .errorObject:
            guard let newError = error else {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
                return
            }
            
            if newError.localizedFailureReason == nil {
                SVProgressHUD.showError(withStatus: "Error:出错拉")
            } else {
                SVProgressHUD.showError(withStatus: error!.localizedFailureReason)
            }
            break
        case .errorString:
            SVProgressHUD.showError(withStatus: status)
            break
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
            break
        case .loading:
            SVProgressHUD.show(withStatus: status)
            break
        }
    }
    
    fileprivate enum HUDType: Int {
        case success, errorObject, errorString, info, loading
    }
    
}
