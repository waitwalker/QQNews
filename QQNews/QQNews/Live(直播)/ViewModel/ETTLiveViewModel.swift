//
//  ETTLiveViewModel.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ETTLiveViewModel: NSObject 
{
    //精选
    typealias choiceCallBack = (_ dataArray:NSMutableArray)->Void
    
    func getChoiceData(callBack:choiceCallBack) -> Void 
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1c62ae5d4e&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=QNLiveVideoViewController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
                case true:
                    
                    if let value = responseData.result.value
                    {
                        let json = JSON(value)
                        let dataArray = NSMutableArray()
                        let idlistFirst = json["idlist"].array?.first;
                        
                        
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                break;
                
                case false:
                
                break;
            }
            
        }
        
    }
    
    
    
    
    
}
