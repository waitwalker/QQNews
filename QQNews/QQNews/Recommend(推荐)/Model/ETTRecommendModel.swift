//
//  ETTRecommendModel.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/3.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTRecommendModel: NSObject 
{
    var id:String?
    var uinnick:String?      //String    福州晚报
    var uinname:String?      //String    news_news_top
    var title:String?        //String    女店员摔断千万元玉镯瘫倒在地大哭 老板选择原谅她
    var longtitle:String?    //String    女店员摔断千万元玉镯瘫倒在地大哭 老板选择原谅她
    var surl:String?         //String    https://view.inews.qq.com/a/20170630A08G2F00
    var short_url:String?    //String    https://view.inews.qq.com/a/20170630A08G2F00
    var weiboid:String?      //String
    var commentid:String?    //String    2009004518
    var url:String?          //String    https://view.inews.qq.com/a/20170630A08G2F00
    var time:String?         //String    2017-06-30 19:05:27
    var timestamp:Int?       //Integer    1498820727
    var articletype:String?  // String    0
    var media_id:String?     //String    5279510
    var showType_video:String?    //String    normal
    var thumbnails_big:Array<Any>?    //Array
    var thumbnails:Array<Any>?    //Array
    var thumbnailsString:String?
    
    var qishu:String?    //String
    var source:String?    //String    福州晚报
    var imagecount:Int?    //Integer    0
    var comment:String?    //String
    var flag:String?    //String
    var tag:Array<Any>?    //Array
    var thumbnails_qqnews:Array<Any>?    //Array
    var voteId:String?    //String
    var voteNum:String?    //String
    var abstract:String?    //String    近日一女子在云南旅游购物时不慎摔断店家标价30万元的翡翠手镯后被吓晕，引起网友强烈关注。记者昨日采访得知，我省甚至出现过金店女店员将价值1000多万元的玉镯摔断的事。　　那么，该如何正确拿取玉石手镯？手镯摔断后还有什么补救方法？昨日记者就这些问题采访了我省珠宝专家和品牌珠宝商。厦门一女店员摔断千万元玉镯据...
    var pushCommentCount:Int?    //Integer    0
    var graphicLiveID:String?    //String
    var specialID:String?    //String
    var thumbnails_qqnews_photo:Array<Any>?    //Array
    var showType:String?    //String    three
    var show_expr:Int?    //Integer    1
    var openAds:Int?    //Integer    0
    var openAdsText:Int?    //Integer    0
    var openAdsComment:Int?    //Integer    0
    var openAdsPhotos:Int?    //Integer    0
    var adTitle:String?    //String
    var chlid:String?    //String    5279510
    var gesture:Int?    //Integer    1
    var smallWindow:Int?    //Integer    1
    var openBigImage:Int?    //Integer    0
    var commentPlacementId:String?    //String    8863362282584659151
    var showBigPicStyle:String?    //String    0
    var bigPicStyleImg:String?    //String
    var FadCid:String?    //String
    var showType_title:Int?    //Integer    1
    var disableDelete:Int?    //Integer    0
    var card:ETTRecommendCardModel?
    var picShowType:Int?    //Integer    0
    var show_source:Int?    //Integer    0
    var forbidCommentUpDown:Int?    //Integer    1
    var disableDeclare:Int?    //Integer    0
    var forbidExpr:Int?    //Integer    0
    var isSensitive:Int?    //Integer    0
    var forbidRedPacket:Int?    //Integer    0
    var toneScore:String?    //String    2
    var qualityScore:String?    //String    3
    var bigImage:Array<Any>?    //Array
    var realChlName:String?    //String    要闻
    var dislikeOption:Array<Any>?    //Array
    var a_ver:String?    //String    00
    var alg_version:Int?    //Integer    1
    var labelList:Array<Any>?    //Array
    var reasonInfo:String?    //String
    var seq_no:String?    //String    237098986453$$$2-3--要闻-0
    var article_pos:Int?    //Integer    1
    var video_channel:ETTRecommendVideoChannelModel?
}
