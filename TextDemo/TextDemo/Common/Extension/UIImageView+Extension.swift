//
//  UIImageView+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    /// 便利构造函数
    ///
    /// - Parameter imageName: xxx
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
    
}


// MARK: 对图片加载进行一次封装，现在使用 Kingfisher
extension UIImageView {
    
    /// 原图片
    func lc_setImage(with url: String?, placeholderImage placeholder: UIImage? = nil) {
        guard let url = url, let Url = URL(string: url) else { return }
        self.kf.setImage(with: Url, placeholder: placeholder)
    }
    
    /// 切圆角
    func lc_setCircular(with url: String?, placeholderImage placeholder: UIImage? = nil) {
        self.lc_setRound(with: url, placeholderImage: placeholder, cornerRadiusRatio: self.width/2)
    }
    
    // 设置cornerRadiusRatio
    func lc_setCornerRadius(with url: String?,placeholderImage placeholder: UIImage? = nil, cornerRadiusRatio: CGFloat? = nil) {
        self.lc_setRound(with: url, placeholderImage: placeholder, cornerRadiusRatio: cornerRadiusRatio)
    }
    
    /// 图片下载
    func lc_setRound(with url: String?,placeholderImage placeholder: UIImage? = nil, cornerRadiusRatio: CGFloat? = nil, progressBlock: ImageDownloaderProgressBlock? = nil) {
        
        guard let urlString = url, let Url = URL(string: urlString) else {
            printLog("图片url---错误")
            return
        }
        
        let memoryImage = KingfisherManager.shared.cache.retrieveImageInMemoryCache(forKey: urlString)
        let diskImage = KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: urlString)
        
        guard let image = memoryImage ?? diskImage else {
            
            let optionInfo: KingfisherOptionsInfo = [.forceRefresh]
            
            // 下载图片
            KingfisherManager.shared.downloader.downloadImage(with: Url, options: optionInfo, progressBlock: progressBlock) { (image, error, url, data) in
                
                if let img = image, let da = data {
                    
                    DispatchQueue.global(qos: .default).async(execute: {
                        // 对图片近些切割圆角
                        let roundedImg = img.roundWithCornerRadius(img.size.width * (cornerRadiusRatio ?? 0.5))
                        // 保存到本地
                        KingfisherManager.shared.cache.store(roundedImg, original: da, forKey: urlString, processorIdentifier: "", cacheSerializer: DefaultCacheSerializer.default, toDisk: true, completionHandler: {
                            self.lc_setImage(with: urlString)
                        })
                    })
                }
            }
            
            return
        }
        self.image = image
    }
    
}

