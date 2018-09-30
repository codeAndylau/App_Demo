//
//  HomeViewModel.swift
//  TextDemo
//
//  Created by Andylau on 2018/9/28.
//  Copyright © 2018年 Andylau. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewModel: NSObject {
    
    let data = Variable<[HomeModel]>([])
    
    var index: Int = 1
    let disposeBag = DisposeBag()
    let refreshStatus = Variable<RefreshStatus>(.none)
    
    /// 外界通过该属性告诉viewModel加载数据（传入的值是为了标志是否重新加载）
    let requestCommond = PublishSubject<Bool>()
    
    // 单列模式: 只有一个实例, 内存地址唯一，实现全局资源共享
    static let homeModel = HomeViewModel()
    
}

extension HomeViewModel: LCViewModelType {

    typealias Input = HomeInput
    typealias Output = HomeOutput
    
    
    struct HomeInput {}
    
    struct HomeOutput {
        
        let sections: Driver<[HomeSection]>
        
        /// 自定义析构函数
        init(sections: Driver<[HomeSection]>) {
            self.sections = sections
        }
    }
    
    func transform(input: HomeViewModel.HomeInput) -> HomeViewModel.HomeOutput {
        
        let sections = data.asObservable().map { (model) -> [HomeSection] in
            return [HomeSection(items: model)]
            }.asDriver(onErrorJustReturn: [])

        let output = HomeOutput(sections: sections)

        /// 上啦加载或者下啦刷新
        requestCommond.subscribe { (flag) in
            
            guard let flag = flag.element else { return }
            
            
            
            
        }.disposed(by: disposeBag)
        
        return output
    }
    
}

struct HomeSection {
    var items: [Item]
}

extension HomeSection: SectionModelType {
    
    typealias Item = HomeModel
    
    init(original: HomeSection, items: [HomeSection.Item]) {
        self = original
        self.items = items
    }
}
