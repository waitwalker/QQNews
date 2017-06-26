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
        let URI:String = "getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f0105aa6744&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=QNVideoDetailListViewController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        let urlString = String(format: "%@%@", kHost,URI)
        
        
        let videoString:String = "http://r.inews.qq.com/getQQNewsUnreadList?apptype=ios&startarticleid=&__qnr=1f0105aa6744&isJailbreak=0&omgid=1f7ac4fc616e0942435905420becda0283e4001011250f&idfa=55148347-614B-419F-B9BD-47DAFD16F7E0&qqnews_refpage=QNVideoDetailListViewController&device_model=iPhone9%2C2&appver=10.2_qqnews_5.3.6&network_type=wifi&omgbizid=04f69dc08c3b1342e7f9c1c102839988a163006011250f&screen_height=736&devid=E1C17BCC-02CA-4AD1-BEAB-6A04B12B68F5&screen_scale=3&screen_width=414&store=1&activefrom=icon";
        
        print("请求地址",urlString);
        
        Alamofire.request(videoString, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            switch dataResponse.result.isSuccess{
                
            case true: 
                if let value = dataResponse.result.value
                {
                    //创建swiftJSON对象
                    let json = JSON(value);
                    
                    //print(json)
                    
                    let videoListArray:NSMutableArray = NSMutableArray();
                    
                    
                    if let newslist = json["newslist"].array
                    {
                        print(newslist);
                        
                        for subJson in newslist
                        {
                            let videoNewsModel = ETTVideoNewsModel();
                            videoNewsModel.isSensitive = subJson["isSensitive"].int;
                            videoNewsModel.toneScore = subJson["toneScore"].string;
                            videoNewsModel.weiboid = subJson["weiboid"].string;
                            videoNewsModel.tag = subJson["tag"].array;
                            videoNewsModel.qualityScore = subJson["qualityScore"].string;
                            videoNewsModel.disableDelete = subJson["disableDelete"].int;
                            videoNewsModel.longtitle = subJson["longtitle"].string;
                            videoNewsModel.disableDeclare = subJson["disableDeclare"].int;
                            videoNewsModel.timestamp = subJson["timestamp"].int;
                            videoNewsModel.showBigPicStyle = subJson["showBigPicStyle"].string;
                            videoNewsModel.commentPlacementId = subJson["commentPlacementId"].string;
                            videoNewsModel.id = subJson["id"].string;
                            videoNewsModel.imagecount = subJson["imagecount"].int;
                            videoNewsModel.pushCommentCount = subJson["pushCommentCount"].int;
                            videoNewsModel.url = subJson["url"].string;
                            videoNewsModel.time = subJson["time"].string;
                            videoNewsModel.voteId = subJson["voteId"].string;
                            videoNewsModel.articletype = subJson["articletype"].string;
                            videoNewsModel.alg_version = subJson["alg_version"].int;
                            videoNewsModel.openAdsText = subJson["openAdsText"].int;
                            videoNewsModel.realChlName = subJson["realChlName"].string;
                            videoNewsModel.qishu = subJson["qishu"].string;
                            videoNewsModel.openAds = subJson["openAds"].int;
                            videoNewsModel.adTitle = subJson["adTitle"].string;
                            videoNewsModel.uinnick = subJson["uinnick"].string;
                            videoNewsModel.thumbnails_qqnews = subJson["thumbnails_qqnews"].array;
                            videoNewsModel.flag = subJson["flag"].string;
                            videoNewsModel.bigImage = subJson["bigImage"].array;
                            videoNewsModel.show_expr = subJson["show_expr"].int;
                            videoNewsModel.voteNum = subJson["voteNum"].string;
                            videoNewsModel.commentid = subJson["commentid"].string;
                            videoNewsModel.labelList = subJson["labelList"].array;
                            videoNewsModel.abstract = subJson["abstract"].string;
                            videoNewsModel.gesture = subJson["gesture"].int;
                            videoNewsModel.source = subJson["source"].string;
                            videoNewsModel.zjTitle = subJson["zjTitle"].string;
                            videoNewsModel.videoTotalTime = subJson["videoTotalTime"].string;
                            videoNewsModel.thumbnails_qqnews_photo = subJson["thumbnails_qqnews_photo"].array;
                            videoNewsModel.short_url = subJson["short_url"].string;
                            videoNewsModel.smallWindow = subJson["smallWindow"].int;
                            videoNewsModel.forbidExpr = subJson["forbidExpr"].int;
                            videoNewsModel.forbidCommentUpDown = subJson["forbidCommentUpDown"].int;
                            videoNewsModel.bigPicStyleImg = subJson["bigPicStyleImg"].string;
                            videoNewsModel.uinname = subJson["uinname"].string;
                            videoNewsModel.thumbnails = subJson["thumbnails_big"].array;
                            videoNewsModel.showType = subJson["showType"].string;
                            videoNewsModel.showType_video = subJson["showType_video"].string;
                            videoNewsModel.showType_title = subJson["showType_title"].string;
                            videoNewsModel.title = subJson["title"].string;
                            videoNewsModel.comment = subJson["comment"].string;
                            videoNewsModel.media_id = subJson["media_id"].string;
                            videoNewsModel.article_pos = subJson["article_pos"].int;
                            
                            let videoChannelModel = ETTVideoChannelModel();
                            
                            videoChannelModel.eid = subJson["video_channel"]["eid"].string;
                            videoChannelModel.egid = subJson["video_channel"]["egid"].string;
                            videoChannelModel.openSupport = subJson["video_channel"]["openSupport"].int;
                            
                            let videoModel = ETTVideoModel();
                            videoModel.playmode = subJson["video_channel"]["video"]["playmode"].int;
                            videoModel.img = subJson["video_channel"]["video"]["img"].string;
                            videoModel.height = subJson["video_channel"]["video"]["height"].int;
                            videoModel.playcount = subJson["video_channel"]["video"]["playcount"].int;
                            videoModel.width = subJson["video_channel"]["video"]["width"].int;
                            videoModel.vid = subJson["video_channel"]["video"]["vid"].string;
                            videoModel.duration = subJson["video_channel"]["video"]["duration"].string;
                            videoModel.videosourcetype = subJson["video_channel"]["video"]["videosourcetype"].int;
                            videoModel.desc = subJson["video_channel"]["video"]["desc"].string;
                            videoModel.playurl = subJson["video_channel"]["video"]["playurl"].string;
                            videoChannelModel.video = videoModel;
                            
                            videoNewsModel.video_channel = videoChannelModel;
                            videoNewsModel.show_source = subJson["show_source"].int;
                            videoNewsModel.openAdsPhotos = subJson["openAdsPhotos"].int;
                            videoNewsModel.a_ver = subJson["a_ver"].string;
                            videoNewsModel.videoNum = subJson["videoNum"].int;
                            videoNewsModel.openBigImage = subJson["openBigImage"].int;
                            videoNewsModel.surl = subJson["surl"].string;
                            videoNewsModel.seq_no = subJson["seq_no"].string;
                            videoNewsModel.specialID = subJson["specialID"].string;
                            videoNewsModel.FadCid = subJson["FadCid"].string;
                            videoNewsModel.openAdsComment = subJson["openAdsComment"].int;
                            videoNewsModel.picShowType = subJson["picShowType"].int;
                            videoNewsModel.reasonInfo = subJson["reasonInfo"].string;
                            videoNewsModel.forbidRedPacket = subJson["forbidRedPacket"].int;
                            videoNewsModel.graphicLiveID = subJson["graphicLiveID"].string;
                            videoNewsModel.thumbnails = subJson["thumbnails"].array;
                            print(videoNewsModel)
                        }
                        
                    }
                }
                break
                
            case false: 
                print(dataResponse.result.error)
                break
            }
        }
            
        }
    }
    

