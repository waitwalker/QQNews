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
    
    // MARK: - 获取要闻列表
    typealias importNewsListCallBack = (_ ipormtNewsListArray:NSMutableArray)->Void
    func getImportNewsListData(callBack:@escaping importNewsListCallBack) -> Void
    {
        let URI:String = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f08e8d71890&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListChannelVideoController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        let URLString = kHost + URI;
        
        
        print("请求地址",URLString);
        
        
        Alamofire.request(URLString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result.isSuccess
            {
            case true:
                
                if let value = response.result.value
                {
                    let json = JSON(value);
                    let dataArray = NSMutableArray();
                    
                    if let newsList = json["newslist"].array
                    {
                        for (subJson:JSON) in newsList
                        {
                            let importNewsModel = ETTImportNewsModel();
                            
                            importNewsModel.title = JSON["title"].string;
                            importNewsModel.thumbnails = JSON["thumbnails"].array;
                            if let string = JSON["thumbnails"].array?.first?.rawString()
                            {
                                importNewsModel.thumbnailsString = string;
                            };
                            importNewsModel.thumbnails_big = JSON["thumbnails_big"].array;
                            importNewsModel.thumbnails_qqnews = JSON["thumbnails_qqnews"].array;
                            importNewsModel.thumbnails_qqnews_photo = JSON["thumbnails_qqnews_photo"].array;
                            importNewsModel.bigImage = JSON["bigImage"].array;
                            importNewsModel.imagecount = JSON["imagecount"].intValue;
                            if let bigString = JSON["thumbnails_qqnews_photo"].array?.first?.rawString()
                            {
                                importNewsModel.thumbnailsBigString = bigString
                            }
                            importNewsModel.videoTotalTime = JSON["videoTotalTime"].string;
                            importNewsModel.source = JSON["source"].string;
                            importNewsModel.videoNum = JSON["videoNum"].intValue;
                            
                            
                            dataArray.add(importNewsModel);
                            
                            
                        }
                        
                    }
                    
                    callBack(dataArray);
                    
                }
                
                break;
                
            case false:
                
                break;
                
            }
        }
    }
    
    
    // MARK: - 获取视频列表数据
    typealias videoListCallBack = (_ videoListArray:NSMutableArray)->Void
    
    func getVideoNewsData(videoNewsCallBack:@escaping videoListCallBack) -> Void
    {
        let URI:String = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f08e1e8a9cf&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        let urlString = String(format: "%@%@", kHost,URI)
        
        Alamofire.request(urlString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            switch dataResponse.result.isSuccess{
                
            case true: 
                if let value = dataResponse.result.value
                {
                    //创建swiftJSON对象
                    let json = JSON(value);
                    
                    let videoListArray:NSMutableArray = NSMutableArray();
                    
                    
                    if let newslist = json["newslist"].array
                    {
                        for (subJson:JSON) in newslist
                        {
                            let videoNewsModel = ETTVideoNewsModel();
                            videoNewsModel.isSensitive = JSON["isSensitive"].int;
                            
                            videoNewsModel.toneScore = JSON["toneScore"].string;
                            videoNewsModel.weiboid = JSON["weiboid"].string;
                            videoNewsModel.tag = JSON["tag"].array;
                            videoNewsModel.qualityScore = JSON["qualityScore"].string;
                            videoNewsModel.disableDelete = JSON["disableDelete"].int;
                            videoNewsModel.longtitle = JSON["longtitle"].string;
                            videoNewsModel.disableDeclare = JSON["disableDeclare"].int;
                            videoNewsModel.timestamp = JSON["timestamp"].int;
                            videoNewsModel.showBigPicStyle = JSON["showBigPicStyle"].string;
                            videoNewsModel.commentPlacementId = JSON["commentPlacementId"].string;
                            videoNewsModel.id = JSON["id"].string;
                            videoNewsModel.imagecount = JSON["imagecount"].int32Value;
                            videoNewsModel.pushCommentCount = JSON["pushCommentCount"].int;
                            videoNewsModel.url = JSON["url"].string;
                            videoNewsModel.time = JSON["time"].string;
                            videoNewsModel.voteId = JSON["voteId"].string;
                            videoNewsModel.articletype = JSON["articletype"].string;
                            videoNewsModel.alg_version = JSON["alg_version"].int;
                            videoNewsModel.openAdsText = JSON["openAdsText"].int;
                            videoNewsModel.realChlName = JSON["realChlName"].string;
                            videoNewsModel.qishu = JSON["qishu"].string;
                            videoNewsModel.openAds = JSON["openAds"].int;
                            videoNewsModel.adTitle = JSON["adTitle"].string;
                            videoNewsModel.uinnick = JSON["uinnick"].string;
                            videoNewsModel.thumbnails_qqnews = JSON["thumbnails_qqnews"].array;
                            videoNewsModel.flag = JSON["flag"].string;
                            videoNewsModel.bigImage = JSON["bigImage"].array;
                            videoNewsModel.show_expr = JSON["show_expr"].int;
                            videoNewsModel.voteNum = JSON["voteNum"].string;
                            videoNewsModel.commentid = JSON["commentid"].string;
                            videoNewsModel.labelList = JSON["labelList"].array;
                            videoNewsModel.abstract = JSON["abstract"].string;
                            videoNewsModel.gesture = JSON["gesture"].int;
                            videoNewsModel.source = JSON["source"].string;
                            videoNewsModel.zjTitle = JSON["zjTitle"].string;
                            videoNewsModel.videoTotalTime = JSON["videoTotalTime"].string;
                            videoNewsModel.thumbnails_qqnews_photo = JSON["thumbnails_qqnews_photo"].array;
                            videoNewsModel.short_url = JSON["short_url"].string;
                            videoNewsModel.smallWindow = JSON["smallWindow"].int;
                            videoNewsModel.forbidExpr = JSON["forbidExpr"].int;
                            videoNewsModel.forbidCommentUpDown = JSON["forbidCommentUpDown"].int;
                            videoNewsModel.bigPicStyleImg = JSON["bigPicStyleImg"].string;
                            videoNewsModel.uinname = JSON["uinname"].string;
                            videoNewsModel.thumbnails = JSON["thumbnails_big"].array;
                            videoNewsModel.showType = JSON["showType"].string;
                            videoNewsModel.showType_video = JSON["showType_video"].string;
                            videoNewsModel.showType_title = JSON["showType_title"].string;
                            videoNewsModel.title = JSON["title"].string;
                            videoNewsModel.comment = JSON["comment"].string;
                            videoNewsModel.media_id = JSON["media_id"].string;
                            videoNewsModel.article_pos = JSON["article_pos"].int;
                            videoNewsModel.chlsicon = JSON["chlsicon"].stringValue;
                            videoNewsModel.chlicon = JSON["chlicon"].stringValue;
                            
                            if let bigImageString = JSON["bigImage"].arrayValue.first?.rawString()
                            {
                                videoNewsModel.bigImageString = bigImageString;
                            }
                            
                            let videoChannelModel = ETTVideoChannelModel();
                            
                            videoChannelModel.eid = JSON["video_channel"]["eid"].string;
                            videoChannelModel.egid = JSON["video_channel"]["egid"].string;
                            videoChannelModel.openSupport = JSON["video_channel"]["openSupport"].int;
                            
                            let videoModel = ETTVideoModel();
                            videoModel.playmode = JSON["video_channel"]["video"]["playmode"].int;
                            videoModel.img = JSON["video_channel"]["video"]["img"].string;
                            videoModel.height = JSON["video_channel"]["video"]["height"].int;
                            videoModel.playcount = JSON["video_channel"]["video"]["playcount"].int;
                            videoModel.width = JSON["video_channel"]["video"]["width"].int;
                            videoModel.vid = JSON["video_channel"]["video"]["vid"].string;
                            videoModel.duration = JSON["video_channel"]["video"]["duration"].string;
                            videoModel.videosourcetype = JSON["video_channel"]["video"]["videosourcetype"].int;
                            videoModel.desc = JSON["video_channel"]["video"]["desc"].string;
                            videoModel.playurl = JSON["video_channel"]["video"]["playurl"].string;
                            videoChannelModel.video = videoModel;
                            
                            videoNewsModel.video_channel = videoChannelModel;
                            videoNewsModel.show_source = JSON["show_source"].int;
                            videoNewsModel.openAdsPhotos = JSON["openAdsPhotos"].int;
                            videoNewsModel.a_ver = JSON["a_ver"].string;
                            videoNewsModel.videoNum = JSON["videoNum"].int32;
                            videoNewsModel.openBigImage = JSON["openBigImage"].int;
                            videoNewsModel.surl = JSON["surl"].string;
                            videoNewsModel.seq_no = JSON["seq_no"].string;
                            videoNewsModel.specialID = JSON["specialID"].string;
                            videoNewsModel.FadCid = JSON["FadCid"].string;
                            videoNewsModel.openAdsComment = JSON["openAdsComment"].int;
                            videoNewsModel.picShowType = JSON["picShowType"].int;
                            videoNewsModel.reasonInfo = JSON["reasonInfo"].string;
                            videoNewsModel.forbidRedPacket = JSON["forbidRedPacket"].int;
                            videoNewsModel.graphicLiveID = JSON["graphicLiveID"].string;
                            videoNewsModel.thumbnails = JSON["thumbnails"].array;
                            
                            videoListArray.add(videoNewsModel);
                        }
                        videoNewsCallBack(videoListArray);
                        
                    }
                }
                break
                
            case false:
                
                break
            }
        }
        
    }
    
    // MARK: - 获取北京列表数据
    typealias beijingDataCallBack = (_ beijingArray:NSMutableArray)->Void
    func getBeijingData(callBack:@escaping beijingDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f4409f2b&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListChannelVideoController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        Alamofire.request(URLString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result.isSuccess
            {
            case true:
                if let value = response.result.value
                {
                    let json = JSON(value)
                    
                    let dataArray = NSMutableArray();
                    
                    
                    if let newslist = json["newslist"].array
                    {
                        for (subJson:JSON) in newslist
                        {
                            let newsModel = ETTNewsModel()
                            newsModel.title = JSON["title"].string;
                            newsModel.thumbnails = JSON["thumbnails"].array;
                            if let string = JSON["thumbnails"].array?.first?.rawString()
                            {
                                newsModel.thumbnailsString = string;
                            };
                            
                            if let bigString = JSON["thumbnails_qqnews_photo"].array?.first?.rawString()
                            {
                                newsModel.thumbnailsBigString = bigString
                            }
                            
                            newsModel.thumbnails_big = JSON["thumbnails_big"].array;
                            newsModel.thumbnails_qqnews = JSON["thumbnails_qqnews"].array;
                            newsModel.thumbnails_qqnews_photo = JSON["thumbnails_qqnews_photo"].array;
                            newsModel.bigImage = JSON["bigImage"].array;
                            newsModel.imagecount = JSON["imagecount"].int32Value;
                            newsModel.videoTotalTime = JSON["videoTotalTime"].string;
                            newsModel.source = JSON["source"].string;
                            newsModel.videoNum = JSON["videoNum"].int32Value;
                            
                            dataArray.add(newsModel);
                            
                        }
                    }
                    callBack(dataArray)
                }
                break
            case false:
                break
            }
        }
    }
    
    // MARK: - 获取政务数据
    typealias governmentDataCallBack = (_ governmentArray:NSMutableArray)->Void
    func getGovernmentData(callBack:@escaping governmentDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f85c86c9&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取宠物数据
    typealias petDataCallBack = (_ petArray:NSMutableArray)->Void
    func getPetData(callBack:@escaping petDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f8445b5f&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取足球数据
    typealias footballDataCallBack = (_ footballArray:NSMutableArray)->Void
    func getFootballyData(callBack:@escaping footballDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f823e1d5&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取韩流数据
    typealias koreanDataCallBack = (_ koreanArray:NSMutableArray)->Void
    func getKoreanData(callBack:@escaping koreanDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f80bd0c4&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取综艺数据
    typealias varietyDataCallBack = (_ varietyArray:NSMutableArray)->Void
    func getVarietyData(callBack:@escaping varietyDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f7ce84a2&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取美容数据
    typealias beautyDataCallBack = (_ beautyArray:NSMutableArray)->Void
    func getBeautyData(callBack:@escaping beautyDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f7b94ec4&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取教育数据
    typealias educationDataCallBack = (_ educationArray:NSMutableArray)->Void
    func getEducationyData(callBack:@escaping educationDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f797d8eb&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取电影数据
    typealias movieDataCallBack = (_ movieArray:NSMutableArray)->Void
    func getMovieData(callBack:@escaping movieDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f77ef706&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取数码数据
    typealias digitalDataCallBack = (_ digitalArray:NSMutableArray)->Void
    func getDigitalData(callBack:@escaping digitalDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f75fe518&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取图片数据
    typealias pictureDataCallBack = (_ pictureArray:NSMutableArray)->Void
    func getPictureData(callBack:@escaping pictureDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f72c29e1&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取游戏数据
    typealias gameDataCallBack = (_ gameArray:NSMutableArray)->Void
    func getGameData(callBack:@escaping gameDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f70c54e0&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取时尚数据
    typealias fashionDataCallBack = (_ fashionArray:NSMutableArray)->Void
    func getFashionData(callBack:@escaping fashionDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6ed1102&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取国际数据
    typealias internationDataCallBack = (_ internationArray:NSMutableArray)->Void
    func getInternationData(callBack:@escaping internationDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6d50618&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取军事数据
    typealias militaryDataCallBack = (_ militaryArray:NSMutableArray)->Void
    func getMilitaryData(callBack:@escaping militaryDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6986a1f&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取社会数据
    typealias societyDataCallBack = (_ societyArray:NSMutableArray)->Void
    func getSocietyData(callBack:@escaping societyDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6811337&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    
    // MARK: - 获取科技数据
    typealias technologyDataCallBack = (_ technologyArray:NSMutableArray)->Void
    func getTechnologyData(callBack:@escaping technologyDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6594742&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取汽车数据
    typealias autoDataCallBack = (_ sutoArray:NSMutableArray)->Void
    func getAutoData(callBack:@escaping autoDataCallBack) -> Void
    {
        let URI = "getQQNewsIndexAndItems?apptype=ios&startarticleid=&__qnr=1f12f6383655&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取NBA数据
    typealias NBADataCallBack = (_ NBAArray:NSMutableArray)->Void
    func getNBAData(callBack:@escaping NBADataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f6143300&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取体育数据
    typealias sportDataCallBack = (_ sportArray:NSMutableArray)->Void
    func getSportData(callBack:@escaping sportDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f5efe38a&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取娱乐数据
    typealias entertainmentDataCallBack = (_ entertainmentArray:NSMutableArray)->Void
    func getEntertainmentData(callBack:@escaping entertainmentDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f5d50f9a&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    // MARK: - 获取财经数据
    typealias financeDataCallBack = (_ financeArray:NSMutableArray)->Void
    func getFinanceData(callBack:@escaping financeDataCallBack) -> Void
    {
        let URI = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f12f5b4a5a7&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon"
        let URLString = kHost + URI
        let dataArray = NSMutableArray()
        
        self.getNewsData(urlString: URLString, dataArray: dataArray)
        
        callBack(dataArray)
    }
    
    func getNewsData(urlString:String, dataArray:NSMutableArray) -> Void
    {
        Alamofire.request(urlString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result.isSuccess
            {
            case true:
                if let value = response.result.value
                {
                    let json = JSON(value)
                    
                    if let newslist = json["newslist"].array
                    {
                        for (subJson:JSON) in newslist
                        {
                            let newsModel = ETTNewsModel()
                            newsModel.title = JSON["title"].string;
                            newsModel.thumbnails = JSON["thumbnails"].array;
                            if let string = JSON["thumbnails"].array?.first?.rawString()
                            {
                                newsModel.thumbnailsString = string;
                            };
                            
                            if let bigString = JSON["thumbnails_qqnews_photo"].array?.first?.rawString()
                            {
                                newsModel.thumbnailsBigString = bigString
                            }
                            
                            newsModel.thumbnails_big = JSON["thumbnails_big"].array;
                            newsModel.thumbnails_qqnews = JSON["thumbnails_qqnews"].array;
                            newsModel.thumbnails_qqnews_photo = JSON["thumbnails_qqnews_photo"].array;
                            newsModel.bigImage = JSON["bigImage"].array;
                            newsModel.imagecount = JSON["imagecount"].int32Value;
                            newsModel.videoTotalTime = JSON["videoTotalTime"].string;
                            newsModel.source = JSON["source"].string;
                            newsModel.videoNum = JSON["videoNum"].int32Value;
                            
                            dataArray.add(newsModel);
                            
                        }
                    }
                }
                break
            case false:
                break
            }
        }
    }
    
}
    

