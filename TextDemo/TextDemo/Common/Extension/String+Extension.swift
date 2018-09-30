//
//  String+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

extension String {
    
    // 将原始的 url 编码为合法的 url
    var urlEncoding: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
    }
    
    //将编码后的url转换回原始的url
    var urlDecoding: String {
        return self.removingPercentEncoding ?? ""
    }
    
}

extension NSString {
    
    /// 计算文本的高度
    func getTextHeight(_ width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        return (self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil).size.height)
    }
}
