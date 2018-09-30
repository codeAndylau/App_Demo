//
//  HomeTbCell.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import SnapKit

class HomeTbCell: UITableViewCell {
    
    
    var img = UIImageView()
    var lab = UILabel()
    

    /// 代码方式创建
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// xib 加载的方式
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeTbCell {
    
    func setupUI() {
        addSubview(img)
        addSubview(lab)
        
        img.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        }
        
        lab.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(5)
        }
        
        // 添加约束 xy width height （能保证试图的位置和大小）
        // make 添加约束  update 是更新原来的约束 remake 去掉已有的所有画约束，重新添加约束
        
    }
    
    func animateUpdate() {
        
        // 1. 把约束添加好
        // 2. 调用UIView的动画方法
        
        UIView.animate(withDuration: 1.5) {
            self.lab.layoutIfNeeded() // 更新约束添添加动画
        }
        
        
    }
    
}
