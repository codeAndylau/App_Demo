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
    
    
}
