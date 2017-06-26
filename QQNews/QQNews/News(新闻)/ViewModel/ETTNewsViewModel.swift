//
//  ETTNewsViewModel.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/22.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ETTNewsViewModel: NSObject {

    // MARK: - 获取视频列表数据
    typealias videoListCallBack = (_ videoListArray:NSMutableArray)->Void
    
    func getVideoNewsData(videoNewsCallBack:videoListCallBack) -> Void 
    {
        let URI:String = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f00f7e3988c&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=QNCommonListController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        let urlString = String(format: "%@%@", kHost,URI)
        
        print("请求地址",urlString);
        
        Alamofire.request(urlString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            switch dataResponse.result.isSuccess{
                
            case true: 
                if let value = dataResponse.result.value
                {
                    //创建swiftJSON对象
                    let json = JSON(value);
                    
                    print(json)
                }
                break
                
            case false: 
                print(dataResponse.result.error)
                break
            }
        }
            
        }
    }
    

