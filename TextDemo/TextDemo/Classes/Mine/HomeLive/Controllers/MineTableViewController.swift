//
//  MineTableViewController.swift
//  TextDemo
//
//  Created by lau Andy on 2018/10/6.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class MineTableViewController: UITableViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var settingView: UIView!
    
    // 设置状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCAGradientLayer()
        setshadowColor()
    }

}

extension MineTableViewController {
    
    func setupUI() {
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        extendedLayoutIncludesOpaqueBars = true
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func setCAGradientLayer() {
        // 添加渐变色
        let gl = CAGradientLayer.init()
        gl.frame = topView.frame
        gl.startPoint = CGPoint(x: 0, y: 0.5)
        gl.endPoint = CGPoint(x: 1, y: 0.5)
        gl.colors = [UIColor(r: 11, g: 195, b: 179, alpha: 1).cgColor,
                     UIColor(r: 40, g: 214, b: 142, alpha: 1).cgColor]
        gl.locations = [0,1]
        
        topView.layer.insertSublayer(gl, at: 0)
    }
    
    func setshadowColor() {
        
        let vs: [UIView] = [orderView,serviceView,settingView]
        vs.forEach { (v) in
    
            v.layer.backgroundColor = UIColor(r: 255, g: 255, b: 255, alpha: 1).cgColor
            v.layer.cornerRadius = 8
            
            v.layer.shadowColor = UIColor(r: 0, g: 0, b: 0, alpha: 0.1).cgColor
            v.layer.shadowOffset = CGSize(width: 3, height: 3)
            v.layer.shadowOpacity = 0.8
            v.layer.shadowRadius = 3
            v.layer.masksToBounds = false
        }

    }
    
}
