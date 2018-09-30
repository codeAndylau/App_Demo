//
//  LCViewModelType.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation

protocol LCViewModelType {
    associatedtype Input
    associatedtype Output
    /// 通过输入的数据类型  再去请求输出的数据
    func transform(input: Input) -> Output
}
