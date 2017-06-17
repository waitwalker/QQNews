//
//  ETTMeViewModel.swift
//  QQNews
//
//  Created by WangJunZi on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class ETTMeViewModel: NSObject {
    
    /*
     //格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
     typealias swiftBlock = (str: String) -> Void
     */
    typealias ettCallBack = (_ dataArray:NSMutableArray)->Void;
    
    func getMeData(callBack:ettCallBack) -> Void {
        
        //发送网络请求获取数据
        
        //解析json数据
        
        var jsonData:Data?
        if let meDataFile = Bundle.main.path(forResource: "MeData", ofType: "json")
        {
            jsonData = try?Data.init(contentsOf: URL.init(fileURLWithPath: meDataFile));
            
        } else
        {
            NSLog("失败");
        }
        
        let json = JSON.init(data: jsonData!);
        let result = json["result"].intValue;
        
        if result == 200
        {
            let dataArray:NSMutableArray = NSMutableArray();
            if let dataList = json["dataList"].array
            {
                for (subJson:JSON) in dataList
                {
                    let meModel = ETTMeModel();
                    meModel.nameLabelText = JSON["nameLabelText"].string;
                    meModel.badgeImageViewImage = JSON["badgeImageViewImage"].string;
                    meModel.subNameLabelText = JSON["subNameLabelText"].string;
                    meModel.arrowImageView = JSON["arrowImageView"].string;
                    dataArray.add(meModel);
                }
            }
            callBack(dataArray as NSMutableArray);
        }
    }
    
}
