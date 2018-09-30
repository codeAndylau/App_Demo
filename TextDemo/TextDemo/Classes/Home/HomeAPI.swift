//
//  HomeAPI.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/27.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import Moya

// 首页模块接口
let LCHomeProvider = MoyaProvider<HomeApi>()

enum HomeApi {
    case recommedList
    case recommedAdList
}

extension HomeApi: TargetType {

    var baseURL: URL {
        return URL(string: "xxx")!
    }
    
    var path: String {
        switch self {
        case .recommedAdList:
            return "xxx"
        default:
            return "xxx"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        let parmeters = [String:Any]()
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }

}
