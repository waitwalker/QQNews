//
//  ETTRecommendVideoChannelModel.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/3.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import RealmSwift

class ETTRecommendVideoChannelModel: Object 
{
    var eid:Int? //1,
    var video:ETTRecommendVideoModel?
    var egid:String?
    var openSupport:Int?
}
