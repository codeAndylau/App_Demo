//
//  RefreshView.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import MJRefresh

extension UIScrollView {
    
    var lc_header: MJRefreshHeader {
        get { return mj_header }
        set { mj_header = newValue }
    }

    var lc_footer: MJRefreshFooter {
        get { return mj_footer }
        set { mj_footer = newValue }
    }
    
}

/// 刷新的状态
enum RefreshStatus {
    case none
    case beingHeaderRefresh
    case endHeaderRefresh
    case beingFooterRefresh
    case endFooterRefresh
    case noMoreData
    case resetNoMoreData
    
    static func update(_ status: RefreshStatus, tb: UIScrollView) {
        switch status {
        case .beingHeaderRefresh:
            tb.mj_header.beginRefreshing()
        case .endHeaderRefresh:
            tb.mj_header.endRefreshing()
        case .beingFooterRefresh:
            tb.mj_footer.beginRefreshing()
        case .endFooterRefresh:
            tb.mj_footer.endRefreshing()
        case .noMoreData:
            tb.mj_footer.endRefreshingWithNoMoreData()
        case .resetNoMoreData:
            tb.mj_footer.resetNoMoreData()
        default:
            break
        }
    }
}

/// 下拉加载
class RefreshGifHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        
        let idleImg = [UIImage(named: "host_play_flag_wave_2_18x18_")!]
        let pullingImg = [UIImage(named: "host_play_flag_wave_2_18x18_")!]
        var refreshing = [UIImage]()

        for i in 2..<19 {
            let img = UIImage(named: "host_play_flag_wave_"+"\(i)"+"_18x18_")!
            refreshing.append(img)
        }
        
        setImages(idleImg, for: .idle)
        setImages(pullingImg, for: .pulling)
        setImages(refreshing, duration: 1.0, for: .refreshing)
        
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
    }
    
}

/// 上拉自动加载 - 自动刷新的
class RefreshBackGifFooter: MJRefreshBackGifFooter {
    
    override func prepare() {
        super.prepare()
        
        let idleImg = [UIImage(named: "host_play_flag_wave_2_18x18_")!]
        let pullingImg = [UIImage(named: "host_play_flag_wave_2_18x18_")!]
        var refreshing = [UIImage]()
        
        for i in 2..<19 {
            let img = UIImage(named: "host_play_flag_wave_"+"\(i)"+"_18x18_")!
            refreshing.append(img)
        }
        
        setImages(idleImg, for: .idle)
        setImages(pullingImg, for: .pulling)
        setImages(refreshing, duration: 1.0, for: .refreshing)
        stateLabel.isHidden = true
        isAutomaticallyChangeAlpha = true // 根据拖拽比例自动切换透明度
    }
}

class RefreshAutoHeader: MJRefreshHeader {}

class RefreshFooter: MJRefreshBackNormalFooter {}

class RefreshAutoFooter: MJRefreshAutoFooter {}

class RefreshTipKissFooter: MJRefreshBackFooter {}
