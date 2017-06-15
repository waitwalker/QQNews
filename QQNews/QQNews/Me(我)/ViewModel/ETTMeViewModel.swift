//
//  ETTMeViewModel.swift
//  QQNews
//
//  Created by WangJunZi on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeViewModel: NSObject {
    
    /*
     //格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
     typealias swiftBlock = (str: String) -> Void
     */
    typealias ettCallBack = (_ dataArray:NSArray)->Void;
    
    func getMeData(callBack:ettCallBack) -> Void {
        
        let array = NSArray().adding("23e");
        
        //发送网络请求 获取数据 解析
        
        callBack(array as NSArray);
        
        
    }
    
}
