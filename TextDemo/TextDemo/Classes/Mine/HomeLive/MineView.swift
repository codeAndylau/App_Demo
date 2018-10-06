//
//  MineView.swift
//  TextDemo
//
//  Created by lau Andy on 2018/10/6.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class MineView: UIView, LCLoadXib {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var topView: UIView = {
        let v = UIView()
        return v
    }()
    
}

extension MineView {
    
    func setupUI() {
        addSubview(topView)
        topView.backgroundColor = UIColor.white
        topView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            if IS_IPhone_X {
                make.height.equalTo(300)
            }else {
                make.height.equalTo(200)
            }
        }
 
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        printLog("fff---\(topView.frame)")
        
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
