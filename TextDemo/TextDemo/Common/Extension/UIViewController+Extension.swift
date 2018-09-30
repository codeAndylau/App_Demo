//
//  UIViewController+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

// 系统提示框
extension UIViewController {
    
    // MARK: - Alert Style
    public func showAlertWithTitle(_ title: String?) {
        showAlert(title, message: nil, cancelButtonTitle: "OK")
    }
    
    public func showAlertWithMessage(_ message: String?) {
        showAlert("", message: message, cancelButtonTitle: "OK")
    }
    
    public func showAlert(_ title: String?, message: String?, cancelButtonTitle: String) {
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        showAlert(title, message: message, alertActions: [cancelAction])
    }
    
    public func showAlert(_ title: String?, message: String?, alertActions: [UIAlertAction]) {
        showAlert(title, message: message, preferredStyle: .alert, alertActions: alertActions)
    }
    
    // MARK: - Action Sheet Style
    
    public func showActionSheetWithTitle(_ title: String?) {
        showActionSheet(title, message: nil, cancelButtonTitle: "OK")
    }
    
    
    public func showActionSheetWithMessage(_ message: String?) {
        showActionSheet(nil, message: message, cancelButtonTitle: "OK")
    }
    
    public func showActionSheet(_ title: String?, message: String?) {
        showActionSheet(title, message: message, cancelButtonTitle: "OK")
    }
    
    public func showActionSheet(_ title: String?, message: String?, cancelButtonTitle: String) {
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        showActionSheet(title, message: message, alertActions: [cancelAction])
    }
    
    public func showActionSheet(_ title: String?, message: String?, alertActions: [UIAlertAction]) {
        showAlert(title, message: message, preferredStyle: .actionSheet, alertActions: alertActions)
    }
    
    // MARK: - Common Methods
    
    public func showAlert(_ title: String?, message: String?, preferredStyle: UIAlertController.Style, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}


