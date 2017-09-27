//
//  ETTDataBase.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/4.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit



class ETTDataBase: NSObject 
{
    
//    let databaseFileName = "recommend.sqlite" //数据库名
//    var pathToDatabase: String!  //数据库路径
//    var database: FMDatabase!  //数据库
//    // MARK: - 单例
//    static let sharedInstance = ETTDataBase.init()
//    private override init()
//    {
//        super.init()
//        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as NSString) as String
//        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
//        print(pathToDatabase)
//        self.createDatabase()
//    }
//    
//    func createDatabase() -> Bool
//    {
//        var created = false
//        if !FileManager.default.fileExists(atPath: pathToDatabase)
//        {
//            database = FMDatabase(path: pathToDatabase!) //创建数据库
//            if database != nil
//            {
//                // Open the database.
//                if database.open()
//                { //打开
//                    let createTable = "create table if not exists t_recommend (id integer primary key autoincrement,title text, thumbnailsString text, thumbnailsBigString text,imagecount integer,videoTotalTime text,videoNum integer,source text,url text);"
//                    database.executeUpdate(createTable, withArgumentsIn: nil) //建表
//                    created = true
//                    database.close()
//                }
//                else
//                {
//                    print("Could not open the database.")
//                }
//            }
//        }
//        return created
//    }
//    
//    func openDatabase() -> Bool
//    {
//        if database == nil
//        {
//            if FileManager.default.fileExists(atPath: pathToDatabase)
//            {
//                database = FMDatabase(path: pathToDatabase)
//            }
//        }
//        if database != nil
//        {
//            if database.open()
//            {
//                return true
//            }
//        }
//        return false
//    }
//    
//    func insertObject(recommendModel:ETTRecommendModel) {
//        if openDatabase()
//        {
//            
//            let sqlString = "insert into t_recommend (title, thumbnailsString, thumbnailsBigString,imagecount,videoTotalTime,videoNum,source,url) values ('\(recommendModel.title)','\(recommendModel.thumbnailsString)','\(recommendModel.thumbnailsBigString)','\(recommendModel.imagecount)','\(recommendModel.videoTotalTime)','\(recommendModel.videoNum)','\(recommendModel.source)','\(recommendModel.url)')"
//            if !database.executeStatements(sqlString)
//            {
//                print("Failed to insert initial data into the database.")
//                print(database.lastError(), database.lastErrorMessage())
//            }
//            database.close()
//        }
//    }
//    
//    func queryObject() -> [ETTRecommendModel] {
//        var dataArray = [ETTRecommendModel]()
//        
//        if openDatabase()
//        {
//            let query = "select * from t_recommend where id > 0;"
//            let results = database.executeQuery(query, withArgumentsIn: nil)
//            while (results?.next())!
//            {
//                let recommendModel = ETTRecommendModel()
//                recommendModel.title = results?.object(forColumnName: "title") as! String
//                recommendModel.thumbnailsString = results?.object(forColumnName: "thumbnailsString") as! String
//                recommendModel.thumbnailsBigString = results?.object(forColumnName: "thumbnailsBigString") as! String
//                recommendModel.imagecount = results?.int(forColumn: "imagecount")
//                recommendModel.videoTotalTime = results?.object(forColumnName: "videoTotalTime") as! String
//                recommendModel.videoNum = results?.int(forColumn: "videoNum")
//                recommendModel.source = results?.object(forColumnName: "source") as! String
//                recommendModel.url = results?.object(forColumnName: "url") as! String
//                    
//                
//                
//                dataArray.append(recommendModel)
//            }
//            database.close()
//        }
//        return dataArray
//    }
//    
//    func deleteAllObjects() -> Bool {
//        var deleted = false
//        if openDatabase() {
//            let query = "delete from t_schedual where id > 0?"
//            database.executeUpdate(query, withArgumentsIn: nil)
//            deleted = true
//            database.close()
//        }
//        return deleted
//    }
    
}
