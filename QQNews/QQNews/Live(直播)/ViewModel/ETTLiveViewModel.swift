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
    
    func getChoiceData(callBack:@escaping choiceCallBack) -> Void
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
                        if let idlistFirst = json["idlist"].array?.first
                        {
                            if let newslist = idlistFirst["newslist"].array
                            {
                                
                                print(newslist)
                                for (subJson:JSON) in newslist
                                {
                                    let liveModel = ETTLiveModel()
                                    liveModel.title = JSON["title"].string
                                    liveModel.source = JSON["source"].string
                                    liveModel.is_live = JSON["is_live"].intValue
                                    let live_infoModel = ETTLiveInfoModel()
                                    live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                    live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                    live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                    if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                    {
                                        liveModel.bigImageString = bigImageString
                                        
                                    }
                                    
                                    if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                    {
                                        
                                        liveModel.thumbnailsString = thumbnailsString
                                    }
                                    
                                    liveModel.live_info = live_infoModel
                                    dataArray.add(liveModel)
                                }
                            }
                            
                        }
                        callBack(dataArray)
                        
                    }
                break
                
                case false:
                    print("精选网络请求错误")
                break
            }
            
        }
        
    }
    
    //资讯
    typealias informationCallBack = (_ dataArray:NSMutableArray) ->Void
    func getInformationData(callBack:@escaping informationCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e43745055&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("精选网络请求错误")
                break
            }
            
        }
        
    }
    
    //文艺
    typealias literatureCallBack = (_ dataArray:NSMutableArray) ->Void
    func getLiteratureData(callBack:@escaping literatureCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    //娱乐
    typealias entertainmentCallBack = (_ dataArray:NSMutableArray) ->Void
    func getEntertainmentData(callBack:@escaping entertainmentCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    //财经
    typealias financeCallBack = (_ dataArray:NSMutableArray) ->Void
    func getFinanceData(callBack:@escaping financeCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    
    //电视台
    typealias TVStationCallBack = (_ dataArray:NSMutableArray) ->Void
    func getTVStationData(callBack:@escaping TVStationCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    //体育
    typealias sportCallBack = (_ dataArray:NSMutableArray) ->Void
    func getSportData(callBack:@escaping sportCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    //慢视界
    typealias slowHorizonCallBack = (_ dataArray:NSMutableArray) ->Void
    func getSlowHorizonData(callBack:@escaping slowHorizonCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    //生活
    typealias lifeCallBack = (_ dataArray:NSMutableArray) ->Void
    func getLifeData(callBack:@escaping lifeCallBack) -> Void
    {
        let URI = "getLiveNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f1e440f7642&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNLiveVideoViewController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            switch responseData.result.isSuccess
            {
            case true:
                
                if let value = responseData.result.value
                {
                    let json = JSON(value)
                    let dataArray = NSMutableArray()
                    if let idlistFirst = json["idlist"].array?.first
                    {
                        if let newslist = idlistFirst["newslist"].array
                        {
                            
                            print(newslist)
                            for (subJson:JSON) in newslist
                            {
                                let liveModel = ETTLiveModel()
                                liveModel.title = JSON["title"].string
                                liveModel.source = JSON["source"].string
                                liveModel.is_live = JSON["is_live"].intValue
                                let live_infoModel = ETTLiveInfoModel()
                                live_infoModel.online_total = JSON["live_info"]["online_total"].intValue
                                live_infoModel.up_num = JSON["up_num"]["up_num"].intValue
                                live_infoModel.orderLive_num = JSON["orderLive_num"]["orderLive_num"].intValue
                                if let bigImageString = JSON["bigImage"].array?.first?.rawString()
                                {
                                    liveModel.bigImageString = bigImageString
                                    
                                }
                                
                                if let thumbnailsString = JSON["thumbnails"].array?.first?.rawString()
                                {
                                    
                                    liveModel.thumbnailsString = thumbnailsString
                                }
                                
                                liveModel.live_info = live_infoModel
                                dataArray.add(liveModel)
                            }
                        }
                        
                    }
                    callBack(dataArray)
                    
                }
                break
                
            case false:
                print("网络请求错误")
                break
            }
        }
    }
    
    
}
