//
//  ETTLiveModel.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTLiveModel: NSObject 
{
    var id:String?   //String    ZLV2017071502600400
    var uinnick:String?    //String    腾讯新闻
    var uinname:String?    //String    news_live_main
    var title:String?    //String    重要发布！中国经济晒半年“成绩单”
    var longtitle:String?    //String    重要发布！中国经济晒半年“成绩单”
    var surl:String?    //String    https://view.inews.qq.com/a/ZLV2017071502600403
    var short_url:String?    //String    https://view.inews.qq.com/a/ZLV2017071502600403
    var weiboid:String?    //String    
    var commentid:String?    //String    2030772763
    var url:String?    //String    https://view.inews.qq.com/a/ZLV2017071502600403
    var time:String?    //String    2017-07-15 15:28:50
    var timestamp:Int?    //Integer    1500108601
    var articletype:String?    //String    102
    var media_id:String?    //String    
    var showType_video:String?    //String    normal
    var thumbnails_qqnews_photo:Array<Any> = []    //Array
    var thumbnails_qqnews_photoString:String?
    var thumbnails_qqnews:Array<Any> = []    //Array
    var thumbnails_qqnewsString:String?
    var thumbnails:Array<Any>?   //Array
    var thumbnailsString:String?
    var qishu:String?    //String    
    var source:String?    //String    央视财经
    var imagecount:Int?    //Integer    0
    var comment:String?    //String
    var flag:String?   //String    6
    var tag:Array<Any>?   // Array
    var abstract:String?    //String    
    var pushCommentCount:Int?    //Integer    0
    var graphicLiveID:String?    //String    
    var specialID:String?    //String    
    var showType:String?    //String    three
    var show_expr:Int?    //Integer    1
    var openAds:Int?    //Integer    0
    var openAdsText:Int?    //Integer    0
    var openAdsComment:Int?    //Integer    0
    var openAdsPhotos:Int?    //Integer    0
    var adTitle:String?    //String    
    var gesture:Int?    //Integer    1
    var smallWindow:Int?    //Integer    1
    var openBigImage:Int?    //Integer    0
    var FadCid:String?    //String    
    var roseLiveID:String?    //String    40046263
    var roseFlag:String?    //String    0
    var zhibo_vid:String?    //String    406211202
    var roseLiveStatus:String?    //String    2
    var zhibo_audio_flag:String?    //String    0
    var roseHeadType:Int?    //Integer    1
    var enableCommentPic:Int?    //Integer    1
    var live_info:ETTLiveInfoModel?
    
    var is_live:Int?    //Integer    1
    var picShowType:Int?    //Integer    0
    var show_source:Int?    //Integer    0
    var forbidCommentUpDown:Int?    //Integer    0
    var disableDeclare:Int?    //Integer    1
    var forbidExpr:Int?    //Integer    1
    var disableDelete:Int?    //Integer    0
    var isSensitive:Int?    //Integer    0
    var forbidRedPacket:Int?    //Integer    1
    var toneScore:String?    //String    3
    var qualityScore:String?    //Null    null
    var bigImage:Array<Any>?    //Array
    var bigImageString:String?
    var realChlName:String?    //String    
}
