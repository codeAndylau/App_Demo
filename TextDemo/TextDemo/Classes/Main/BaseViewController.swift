//
//  BaseViewController.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApplicationService.navbarAppearanceConfig(self.navigationController!.navigationBar)
        // 默认情况下extendedLayoutIncludesOpaqueBars = false 扩展布局不包含导航栏
        extendedLayoutIncludesOpaqueBars = true
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            collectionView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        // Do any additional setup after loading the view.
    }

    // MARK: - 懒加载
    lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH), style: .plain)
        tab.backgroundColor = UIColor.white
        tab.separatorStyle = .none
        tab.estimatedRowHeight = 0
        tab.estimatedSectionHeaderHeight = 0
        tab.estimatedSectionFooterHeight = 0
        tab.tableFooterView = UIView()
        return tab
    }()
    
    lazy var collectionView: UICollectionView = { [weak self] in
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
        }()

}
