//
//  GuidePageHUD.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import UIKit

class GuidePageHUD: UIView {

    var imageArray:[String] = []
    var guidePageView: UIScrollView!
    var imagePageControl: UIPageControl?

    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - imageNameArray: 引导页图片数组
    ///   - isHiddenSkipButton: 跳过按钮是否隐藏
    init(imageNameArray:[String], isHiddenSkipButton: Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH)
        super.init(frame: frame)
        self.imageArray = imageNameArray
    
        guard self.imageArray.count != 0 else { return }
    
        self.addScrollView(frame: frame)
        self.addSkipButton(isHiddenSkipButton: isHiddenSkipButton)
        self.addImages()
        self.addPageControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit")
    }
    
}

// MARK: - /************************普通方法************************/
extension GuidePageHUD {
    
    func addScrollView(frame: CGRect) {
        self.guidePageView = UIScrollView.init(frame: frame)
        guidePageView.backgroundColor = UIColor.lightGray
        guidePageView.contentSize = CGSize.init(width: kScreenW * (CGFloat)(self.imageArray.count), height: kScreenH)
        guidePageView.bounces = false
        guidePageView.isPagingEnabled = true
        guidePageView.showsHorizontalScrollIndicator = false
        guidePageView.delegate = self
        self.addSubview(guidePageView)
    }
    // 跳过按钮
    func addSkipButton(isHiddenSkipButton: Bool) {
        if isHiddenSkipButton {
            return
        }
        let skipButton = UIButton.init(frame: CGRect.init(x: kScreenW * 0.8, y: kScreenW * 0.1, width: 70, height: 35))
        skipButton.setTitle("跳过", for: .normal)
        skipButton.backgroundColor = UIColor.gray
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.frame.size.height * 0.5
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        self.addSubview(skipButton)
    }
    @objc func skipButtonClick() {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    // 图片
    func addImages() {

        for i in 0..<imageArray.count {
            let imageView = UIImageView.init(frame: CGRect.init(x: kScreenW * CGFloat(i), y: 0, width: kScreenW, height: kScreenH))
            let idString = (imageArray[i] as NSString).substring(from: imageArray[i].count - 3)
            if idString == "gif" {
//                imageView.image = UIImage.gifImageWithName(imageArray[i])
//                self.guidePageView.addSubview(imageView)
            } else {
                imageView.image = UIImage.init(named: imageArray[i])
                self.guidePageView.addSubview(imageView)
            }
            
            // 在最后一张图片上显示开始体验按钮
            if i == imageArray.count - 1 {
                imageView.isUserInteractionEnabled = true
                let startButton = UIButton.init(frame: CGRect.init(x: kScreenW*0.1, y: kScreenH*0.8, width: kScreenW*0.8, height: kScreenH*0.08))
                startButton.setTitle("开始体验", for: .normal)
                startButton.setTitleColor(UIColor.white, for: .normal)
                startButton.setBackgroundImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
                startButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
                imageView.addSubview(startButton)
            }
        }
    }
    func addPageControl() -> Void {
        // 设置引导页上的页面控制器
        self.imagePageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: kScreenH*0.9, width: kScreenW, height: kScreenH*0.1))
        self.imagePageControl?.currentPage = 0
        self.imagePageControl?.numberOfPages = self.imageArray.count
        self.imagePageControl?.pageIndicatorTintColor = UIColor.gray
        self.imagePageControl?.currentPageIndicatorTintColor = UIColor.white
        self.addSubview(self.imagePageControl!)
    }
}
// MARK: - /************************代理方法************************/
extension GuidePageHUD: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        self.imagePageControl?.currentPage = Int(page)
    }
    
}
