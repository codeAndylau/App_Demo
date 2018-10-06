//
//  MineViewController.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.sendSubviewToBack(view)
    }
    
    lazy var backView: MineView = {
        let v = MineView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        v.backgroundColor = UIColor.cyan
        return v
    }()
    
}

extension MineViewController {
     
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
//        view.addSubview(tableView)
//        tableView.addSubview(backView)
        
        extendedLayoutIncludesOpaqueBars = true
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
}
