//
//  LoginViewController.swift
//  TextDemo
//
//  Created by lau Andy on 2018/10/7.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var verficationBtn: UIButton!
    @IBOutlet weak var passwordBtn: UIButton!
    
    @IBOutlet weak var verficationView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //启用滑动返回（swipe back）
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        // Do any additional setup after loading the view.
    }

    // MARK: - Action
    @IBAction func verficationBtnAction(_ sender: Any) {
        
        UIView.transition(from: verficationView,
                          to: passwordView,
                          duration: 1,
                          options: .curveEaseInOut) { (_) in
                            self.verficationView.isHidden = true
                            
        }
    }
    
    @IBAction func passwordBtnAction(_ sender: Any) {
        
        UIView.transition(from: passwordView,
                          to: verficationView,
                          duration: 1,
                          options: .curveEaseInOut) { (_) in
                            self.passwordView.isHidden = true
                            
        }
    }
    
}
