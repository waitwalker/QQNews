//
//  ETTRecommendViewModel.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/3.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ETTRecommendViewModel: NSObject 
{
    typealias recommendDataCallBack = (_ recommendArray:NSMutableArray)->Void
    
    func getRecommendData(callBack:@escaping recommendDataCallBack) -> Void 
    {
        let URI = "getRecommendList?apptype=ios&startarticleid=&__qnr=1f0b3541d484&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=CPtLoginController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result.isSuccess
            {
                case true:
                if let value = response.result.value
                {
                    let json = JSON(value)
                    
                    let recommendDataArray = NSMutableArray();
                    
                    
                    if let newslist = json["newslist"].array
                    {
                        for (subJson:JSON) in newslist
                        {
                            let recommendModel = ETTRecommendModel()
                            recommendModel.title = JSON["title"].string;
                            recommendModel.thumbnails = JSON["thumbnails"].array;
                            if let string = JSON["thumbnails"].array?.first?.rawString()
                            {
                                recommendModel.thumbnailsString = string;
                            };
                            
                            if let bigString = JSON["thumbnails_qqnews_photo"].array?.first?.rawString()
                            {
                                recommendModel.thumbnailsBigString = bigString
                            }
                            
                            recommendModel.thumbnails_big = JSON["thumbnails_big"].array;
                            recommendModel.thumbnails_qqnews = JSON["thumbnails_qqnews"].array;
                            recommendModel.thumbnails_qqnews_photo = JSON["thumbnails_qqnews_photo"].array;
                            recommendModel.bigImage = JSON["bigImage"].array;
                            recommendModel.imagecount = JSON["imagecount"].intValue;
                            recommendModel.videoTotalTime = JSON["videoTotalTime"].string;
                            recommendModel.source = JSON["source"].string;
                            
                            recommendDataArray.add(recommendModel);
                            
                        }
                    }
                    callBack(recommendDataArray)
                }
                    
                
                break
                
                
                case false:
                
                
                break
            }
        }
        
        
    }
}
