//
//  Array+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation

// 从一个数组中随机获取一个、或多个元素
extension Array {
    
    /// 从数组中返回一个随机的元素
    var sample: Element? {
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
    /// 从数组中返回指定个数的元素
    func sample(size: Int, noRepeat: Bool = false) -> [Element]? {
        //如果数组为空，则返回nil
        guard !isEmpty else { return nil }
        
        var sampleElements: [Element] = []
        
        //返回的元素可以重复的情况
        if !noRepeat {
            for _ in 0..<size {
                sampleElements.append(sample!)
            }
        }
        //返回的元素不可以重复的情况
        else{
            //先复制一个新数组
            var copy = self.map { $0 }
            for _ in 0..<size {
                //当元素不能重复时，最多只能返回原数组个数的元素
                if copy.isEmpty { break }
                let randomIndex = Int(arc4random_uniform(UInt32(copy.count)))
                let element = copy[randomIndex]
                sampleElements.append(element)
                //每取出一个元素则将其从复制出来的新数组中移除
                copy.remove(at: randomIndex)
            }
        }
        
        return sampleElements
    }
}
