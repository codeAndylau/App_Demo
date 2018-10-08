//
//  LoginTableViewController.swift
//  TextDemo
//
//  Created by lau Andy on 2018/10/7.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var headImg: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Action
    @IBAction func jumpAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginTableViewController {
    
    func setupUI() {
        setNavigationBar()
        setGradientLayer()
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
    
    func setGradientLayer() {
        // 添加渐变色
        let gl = CAGradientLayer.init()
        gl.frame = view.frame
        gl.startPoint = CGPoint(x: 0.5, y: 0)
        gl.endPoint = CGPoint(x: 0.5, y: 0.99)
        gl.colors = [UIColor(r: 41, g: 214, b: 143, alpha: 1).cgColor,
                     UIColor(r: 11, g: 196, b: 180, alpha: 1).cgColor]
        gl.locations = [0,1]
        
        let backView = UIView(frame: tableView.frame)
        tableView.backgroundView = backView
        backView.layer.insertSublayer(gl, at: 0)
        
        //
        headImg.cuttingCorner(radius: headImg.height/2)
        loginBtn.cuttingCorner(radius: loginBtn.height/2)
        registerBtn.cuttingCorner(radius: registerBtn.height/2)
        registerBtn.setupBorder(width: 1, color: UIColor.white)
    }
    
   
}

extension LoginTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenH/3
    }
}
