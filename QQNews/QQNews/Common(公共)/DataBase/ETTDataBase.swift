//
//  ETTDataBase.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/4.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import FMDB


class ETTDataBase: NSObject 
{
    var dataBase:FMDatabase?
    
    
    // MARK: - 单例
    static let sharedInstance = ETTDataBase.init()
    private override init() 
    {
        super.init()
        self.openDataBase(name: "/recommend.sqlite")
    }
    
    func openDataBase(name:String) -> Void 
    {
        let filePath = self.documentPath() + name;
        dataBase = FMDatabase(path: filePath)
        
        self.createTable()
    }
    
    func documentPath() -> String 
    {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) .first
        
        print("文件缓存路径",path as Any)
        
        return path!
    }
    
    func createTable() -> Void 
    {
        if (dataBase?.open())!
        {
            let sqlString = "create table if not exists t_recommend(id integer primary key autoincrement,'recommendModel' blob)"
            do 
            {
                try dataBase?.executeUpdate(sqlString, values: nil)
            } catch
            {
                print(dataBase?.lastErrorMessage() as Any)
            }
        } else
        {
            print(dataBase?.lastErrorMessage() as Any)
        }
        dataBase?.close()
    }
    
    
    func addObject(recommendModel:ETTRecommendModel) -> Void 
    {
        if (dataBase?.open())!
        {
            let sqlString = String(format: "insert into t_recommend('recommendModel') values (?)", recommendModel)
            do {
                try dataBase?.executeUpdate(sqlString, values: nil)
            } catch
            {
                print(dataBase?.lastErrorMessage() as Any)
            }
        }
        dataBase?.close()
    }
    
    func deleteAllObjec() -> Void 
    {
        if (dataBase?.open())!
        {
            let sqlString = String(format: "delete from t_recommend where id >0")
            do {
                try dataBase?.executeUpdate(sqlString, values: nil)
            } catch
            {
                print(dataBase?.lastErrorMessage() as Any)
            }
            
        }
        dataBase?.close()
    }
    
    func queryAllObject() -> NSMutableArray
    {
        let dataArray = NSMutableArray()
        
        if (dataBase?.open())!
        {
            let sqlString = String(format: "select *from t_recommend")
            do {
                let result = try dataBase?.executeQuery(sqlString, values: nil)
                while (result?.next())!
                {
                    let recommendModel:ETTRecommendModel = ETTRecommendModel();
                    dataArray.add(recommendModel)
                }
                
            } catch
            {
                print(dataBase?.lastErrorMessage() as Any)
            }
            
        }
        dataBase?.close()
        return dataArray;
    }
}
