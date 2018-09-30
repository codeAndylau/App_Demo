//
//  HomeVC.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import WebKit

class HomeVC: BaseViewController {

    
    lazy var wkWebView = WKWebView()
    
    @IBOutlet weak var btn: UIButton!
    
    var disposeBag = DisposeBag()
    var homeVM = HomeViewModel()
    
   var lab1 = UILabel()
    var lab2 = UILabel()
    var lab3 = UILabel()
    var lab4 = UILabel()
    var lab5 = UILabel()
    var lab6 = UILabel()
    
    @IBAction func btnAction(_ sender: UIButton) {
        printLog("测试单列1---\(HomeViewModel.homeModel)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
            printLog("测试单列2---\(HomeViewModel.homeModel)")
    }
    
    func setupUI() {
        
        // 自动布局和autoresizing 是互斥的 同时只能使用一种, 所以要先禁用autoresizing 将自适应调整掩码转换为约束
        // 注意⚠️： 在添加约束之前一定要保证相关的控件都已经添加到父控件上
        
        
        
//        view.translatesAutoresizingMaskIntoConstraints = false
        let _ = NSLayoutConstraint(item: lab1, attribute: .left, relatedBy: .equal, toItem: lab2, attribute: .centerX, multiplier: 1, constant: 10)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         
//        btn.bringSubviewToFront(self.view)
    }
    
    override func loadView() {
        // 替换主视图
        // view = wkWebView
        
        /*
         1. loadView方法用于自定义控制器的view
         2. 调用控制器的- (void)loadView 方法就不能调用其父类的方法
         3. 可以用来自己定义控制器的view
         
         4. 重写loadView可以减少使用内存，直接帮你创建控制器最想要的View
         5. 如果控制器一开始就想要展示一张图片或者是加载一个网页（webView）可以让控制器的View是iamgeView或者是webView（如上所示）
         */
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
//        tableView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabBarH)
//        view.addSubview(tableView)

        tableView.lc_header = RefreshGifHeader(refreshingBlock: {
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.async {
                 self.tableView.lc_header.endRefreshing()
            }
        })
        
        tableView.lc_footer = RefreshBackGifFooter(refreshingBlock: {
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.async {
                self.tableView.lc_footer.endRefreshing()
            }
        })
        
        
        /// 更新刷新的状态
        homeVM.refreshStatus.asObservable().subscribe { [weak self] (status) in
            
            guard let status = status.element else {
                return
            }
            
            guard let weakSelf = self else {
                return
            }
            
            RefreshStatus.update(status, tb: weakSelf.tableView)
            
            }.disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
