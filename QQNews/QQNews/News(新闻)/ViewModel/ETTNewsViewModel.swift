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
                            print(JSON)
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
        let URI:String = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f0105aa6744&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=QNVideoDetailListViewController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        let urlString = String(format: "%@%@", kHost,URI)
        
        
        let videoString:String = "http://r.inews.qq.com/getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f08e1e8a9cf&global_info=0%7C&omgid=014f6bb2bb7c904d07aad9dcff6aabd976f1001011221e&idfa=30216CDE-F722-49CF-84A2-15EDEE3BB30E&qqnews_refpage=QNCommonListController&isJailbreak=0&appver=10.3.2_qqnews_5.3.7&network_type=wifi&device_model=iPhone7%2C1&omgbizid=e6034a6a2850844febd8b82c1e5dc7b29290006011250f&screen_height=736&devid=7C632112-BA40-425A-8610-780904BF2C5B&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        print("请求地址",urlString);
        
        Alamofire.request(videoString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
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
    }
    

