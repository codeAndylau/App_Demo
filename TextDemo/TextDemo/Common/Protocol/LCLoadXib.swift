//
//  LCLoadXib.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import Foundation

/**
 在协议/结构体/枚举里面 如果要定义类方法,需要用 static 修饰
 在类里面定义类方法, 这时候用 class 修饰
 */

/// 提供Xib 加载方法
protocol LCLoadXib {}
extension LCLoadXib where Self: UIView {
    static func loadFromXib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
    
}

/// 提供Storyboard 加载方法
protocol LCStoryboardLoadable {}
extension LCStoryboardLoadable where Self: UIViewController {
    static func loadStoryboard(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return UIStoryboard(name: loadName, bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
}

/// 注册cell从xib
protocol LCRegisterCellFromNib {}
extension LCRegisterCellFromNib {
    static var identifier: String { return "\(self)" }
    static var nib: UINib? { return UINib(nibName: "\(self)", bundle: nil) }
}

extension UITableView {
    
    /// 注册 cell 的方法
    func lc_registerCell<T: UITableViewCell>(cell: T.Type) where T: LCRegisterCellFromNib {
        if let nib = T.nib { register(nib, forCellReuseIdentifier: T.identifier) }
        else { register(cell, forCellReuseIdentifier: T.identifier) }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func lc_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: LCRegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
}

extension UICollectionView {
    
    /// 注册 cell 的方法
    func lc_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: LCRegisterCellFromNib {
        if let nib = T.nib { register(nib, forCellWithReuseIdentifier: T.identifier) }
        else { register(cell, forCellWithReuseIdentifier: T.identifier) }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func lc_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: LCRegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
    /// 注册头部
    func lc_registerSupplementaryHeaderView<T: UICollectionReusableView>(reusableView: T.Type) where T: LCRegisterCellFromNib {
        // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
        } else {
            register(reusableView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
        }
    }
    
    /// 获取可重用的头部
    func lc_dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: LCRegisterCellFromNib {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
