//
//  ETTDataBase.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/4.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import RealmSwift

class ETTDataBase: NSObject 
{
    let realm:Realm?
    
    // MARK: - 单例
    static let sharedInstance = ETTDataBase.init()
    private override init() 
    {
        realm = try! Realm()
        
    }
    
    func addObject(object:Any) -> Void 
    {
        
    }
    
    func removeAllObjec() -> Void 
    {
        
    }
    
    func queryAllObject() -> Void 
    {
        
        
    }
}
