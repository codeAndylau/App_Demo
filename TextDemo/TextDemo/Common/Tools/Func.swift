//
//  UtilitesTools.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/26.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import Photos
import AssetsLibrary

/// 自定义log方法
public func printLog<T>(_ message: T,file: String = #file,method: String = #function,line: Int = #line) {
    #if DEBUG
    print("[\((file as NSString).lastPathComponent)-第\(line)行-\(method)]: \(message)")
    #endif
}

/// 代码延迟运行
///
/// - Parameters:
///   - delayTime: 延时时间。比如：.seconds(5)、.milliseconds(500)
///   - qosClass: 要使用的全局QOS类（默认为 nil，表示主线程）
///   - closure: 延迟运行的代码
public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil, closure: @escaping () -> Void) {
    let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : DispatchQueue.main
    dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)
}

/// 判断是否有相册权限
public func isRightPhotoAlbum() -> Bool {
    
    let authStatus = PHPhotoLibrary.authorizationStatus()
    printLog("相册权限状态为---\(authStatus.rawValue)")
    if authStatus == .authorized {
        return true
    }else {
        return false
    }
}

/// 判断是否有相机权限
public func isRightCamera() -> Bool {
    
    let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    printLog("相机权限状态为---\(authStatus.rawValue)")
    if authStatus == .authorized {
        return true
    }else {
        return false
    }
    
}

/// 判断是否有麦克风权限
public func isRightMicrophone() -> Bool {
    
    let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
    printLog("麦克风权限权限状态为---\(authStatus.rawValue)")
    if authStatus == .authorized {
        return true
    }else {
        return false
    }
}
