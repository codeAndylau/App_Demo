//
//  UIImage+Extension.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

typealias LCAsset = UIImage.Asset

// MARK: - 对本地的图片近些常量定义
extension UIImage {

    // 便利构造器
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }

    enum Asset : String {

        var image: UIImage { return UIImage(asset: self) }
        
        case Add_friend_icon_addgroup = "add_friend_icon_addgroup"
        case Back_icon = "back_icon"
        
        case common_gray_back = "common_gray_back"
        
        case Chathistory_detail_end = "chathistory_detail_end"
        case Emoticon_keyboard_magnifier = "emoticon_keyboard_magnifier"
        case Emotion_delete = "emotion_delete"
        case Icon_avatar = "icon_avatar"
        case ReceiverImageNodeBorder = "ReceiverImageNodeBorder"
        case MessageTooShort = "MessageTooShort"
        case RecordCancel = "RecordCancel"
        case SenderImageNodeBorder = "SenderImageNodeBorder"
        case Tool_emotion_1 = "tool_emotion_1"
        case Contact_Female = "Contact_Female"
        case Dice_Action_0 = "dice_Action_0"
        case Ff_IconBottle = "ff_IconBottle"
        case MyQRCodeAction = "MyQRCodeAction"
        case Plugins_FriendNotify = "plugins_FriendNotify"
        case Receipt_payment_icon = "receipt_payment_icon"
        case ScanBook = "ScanBook"
        case Tabbar_badge = "tabbar_badge"
        case TabbarBkg = "tabbarBkg"
        case Chat_background = "chat_background"
        case MessageRightTopBg = "MessageRightTopBg"
        
    }
}


// MARK: 对UIImage进行编辑
extension UIImage {
    
    //MARK: - 水印位置枚举
    enum WaterMarkCorner{
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
    
    //MARK: - 添加水印方法
    func waterMarkedImage(_ waterMarkText: String, corner: WaterMarkCorner = .BottomRight) -> UIImage{
        
        let margin:CGPoint = CGPoint(x: 20, y: 20)
        let waterMarkTextColor:UIColor = UIColor.hexColor(0xe52f60)
        let waterMarkTextFont:UIFont = UIFont.systemFont(ofSize: 9)
        let backgroundColor:UIColor = UIColor.clear
        let textAttributes = [NSAttributedString.Key.foregroundColor:waterMarkTextColor,
                              NSAttributedString.Key.font:waterMarkTextFont,
                              NSAttributedString.Key.backgroundColor:backgroundColor]
        
        let textSize = NSString(string: waterMarkText).size(withAttributes: textAttributes)
        var textFrame = CGRect(x: 0, y: 0, width: textSize.width, height: textSize.height)
        
        let imageSize = self.size
        switch corner{
        case .TopLeft:
            textFrame.origin = margin
        case .TopRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x, y: margin.y)
        case .BottomLeft:
            textFrame.origin = CGPoint(x: margin.x, y: imageSize.height - textSize.height - margin.y)
        case .BottomRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x,
                                       y: imageSize.height - textSize.height - margin.y)
        }
        
        // 开始给图片添加文字水印
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        NSString(string: waterMarkText).draw(in: textFrame, withAttributes: textAttributes)
        
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return waterMarkedImage!
    }
    
    //MARK: - 图片和颜色的的交互
    func updateImageWithTintColor(color:UIColor, alpha: CGFloat, rect: CGRect) -> UIImage {
        
        let imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        // 启动图形上下文
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, self.scale)
        // 获取图形上下文
        let contextRef =  UIGraphicsGetCurrentContext()
        // 利用drawInRect方法绘制图片到layer, 是通过拉伸原有图片
        self.draw(in: imageRect)
        // 设置图形上下文的填充颜色
        contextRef!.setFillColor(color.cgColor)
        // 设置图形上下文的透明度
        contextRef!.setAlpha(alpha)
        // 设置混合模式
        contextRef!.setBlendMode(.sourceAtop)
        // 填充当前rect
        contextRef!.fill(rect)
        
        // 根据位图上下文创建一个CGImage图片，并转换成UIImage
        let imageRef = contextRef!.makeImage()
        let tintedImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        // 从堆栈的顶部移除图形上下文
        return tintedImage;
    }
    
    //MARK: - 颜色转图片
    func getImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK: - 重设图片大小
    func reSizeImage(reSize:CGSize)->UIImage {
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    //MARK: - 等比率缩放
    func scaleImageWithNew(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
    //MARK: - 裁剪成一个正方形
    func corpToSquare() -> UIImage? {
        
        let size = CGSize(width: self.size.width * self.scale, height: self.size.height * self.scale)
        let shortest = min(size.width, size.height)
        
        let left: CGFloat = (size.width > shortest) ? (size.width - shortest) / 2 : 0
        let top: CGFloat = (size.height > shortest) ? (size.height - shortest) / 2 : 0
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let insetRect = rect.insetBy(dx: left, dy: top)
        
        return crop(bounds: insetRect)
        
    }
    
    func crop(bounds: CGRect) -> UIImage? {
        return UIImage(cgImage: (self.cgImage?.cropping(to: bounds)!)!,
                       scale: 0.0, orientation: self.imageOrientation)
    }
    
    //MARK: - 拉伸一张图片
    func resizebleImage(imageName:String) -> UIImage {
        
        var imageNor = UIImage.init(named: imageName)!
        let w = imageNor.size.width
        let h = imageNor.size.height
        imageNor = imageNor.resizableImage(withCapInsets: UIEdgeInsets(top: w/2, left: h/2, bottom: w/2, right: h/2), resizingMode: UIImage.ResizingMode.stretch)
        return imageNor
    }
    
    //MARK: - 将图片缩放成指定尺寸（多余部分自动删除）
    func scaled(to newSize: CGSize) -> UIImage {
        //计算比例
        let aspectWidth  = newSize.width/size.width
        let aspectHeight = newSize.height/size.height
        let aspectRatio = max(aspectWidth, aspectHeight)
        
        //图片绘制区域
        var scaledImageRect = CGRect.zero
        scaledImageRect.size.width  = size.width * aspectRatio
        scaledImageRect.size.height = size.height * aspectRatio
        scaledImageRect.origin.x    = (newSize.width - size.width * aspectRatio) / 2.0
        scaledImageRect.origin.y    = (newSize.height - size.height * aspectRatio) / 2.0
        
        //绘制并获取最终图片
        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    // MARK: 切圆角
    func roundWithCornerRadius(_ cornerRadius: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
}
