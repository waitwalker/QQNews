//
//  ETTRecommendViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

/*
     推荐里面用的是要闻类型的cell
 */

import UIKit
import MJRefresh

class ETTRecommendViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource 
{
    var recommendTableView:UITableView?
    var recommendDataArray = NSMutableArray();
    
//    let DataBase = ETTDataBase.sharedInstance
    
    
    let reusedRecommendTextId:String = "reusedRecommendCellId"
    let reusedRecommendPictureId:String = "reusedRecommendPictureId"
    let reusedRecommendVideoId:String = "reusedRecommendVideoId"
    
    
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setupSubviews()
        //self.getDataFromDataBase()
        self.refreshGetNewData()
        
    }
    
    func getDataFromDataBase() -> Void 
    {
//        let dataArr = DataBase.queryObject()
//        
//        if (dataArr.count > 0) {
//            
//            //recommendDataArray = dataArr;
//            for item:ETTRecommendModel in dataArr
//            {
//                recommendDataArray.add(item)
//            }
//            recommendTableView?.reloadData()
//        } else
//        {
//            self.refreshGetNewData()
//        }
        self.refreshGetNewData()
    }
    
    func setupSubviews() -> Void 
    {
        let searchButton = UIButton()
        searchButton.setImage(kImage(named: "search_icon_btn_black"), for: UIControlState.normal)
        searchButton.setImage(kImage(named: "night-search_icon_btn_black"), for: UIControlState.highlighted)
        searchButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        searchButton.setTitle("发现", for: UIControlState.normal)
        searchButton.frame = CGRect(x: -10, y: 0, width: 90, height: 44)
        searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        searchButton.addTarget(self, action: #selector(searchButtonAction(button:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: searchButton);
        
        self.navigationItem.title = "推荐"
        
        recommendTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        recommendTableView?.delegate = self
        recommendTableView?.dataSource = self
        recommendTableView?.register(ETTRecommendTextCell.self, forCellReuseIdentifier: reusedRecommendTextId)
        recommendTableView?.register(ETTRecommendPictureCell.self, forCellReuseIdentifier: reusedRecommendPictureId)
        recommendTableView?.register(ETTRecommendVideoCell.self, forCellReuseIdentifier: reusedRecommendVideoId)
        self.view.addSubview(recommendTableView!)
    }
    
    // MARK: - 搜索按钮的事件回调
    @objc func searchButtonAction(button:UIButton) -> Void
    {
        print("搜索按钮被点击了")
        
    }
    
    func refreshGetNewData() -> Void
    {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(networkRequest))
        header?.setTitle("下拉刷新", for: MJRefreshState.idle)
        header?.setTitle("松手刷新", for: MJRefreshState.pulling)
        header?.setTitle("加载中...", for: MJRefreshState.refreshing)
        header?.beginRefreshing()
        self.recommendTableView?.mj_header = header
    }
    
    @objc func networkRequest() -> Void 
    {
        print("开始刷新")
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) { 
            
            recommendViewModel.getRecommendData(callBack: { (dataArray) in
                
                for item in dataArray
                {
                    self.recommendDataArray.insert(item, at: 0)
                    //self.DataBase.insertObject(recommendModel: item as! ETTRecommendModel)
                }
                
                self.recommendTableView?.reloadData()
            })
            
            self.recommendTableView?.mj_header.endRefreshing()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return recommendDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let recommendModel = recommendDataArray[indexPath.item] as! ETTRecommendModel;
        if recommendModel.videoTotalTime == nil
        {
            if recommendModel.imagecount! > 0
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedRecommendPictureId) as? ETTRecommendPictureCell
                if cell == nil
                {
                    cell = ETTRecommendPictureCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedRecommendPictureId)
                }
                cell?.recommendModel = recommendDataArray[indexPath.item] as? ETTRecommendModel
                
                return cell!
            } else
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedRecommendTextId) as? ETTRecommendTextCell
                if cell == nil
                {
                    cell = ETTRecommendTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedRecommendTextId)
                }
                cell?.recommendModel = recommendDataArray[indexPath.item] as? ETTRecommendModel
                
                return cell!
            }
        } else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: reusedRecommendVideoId) as? ETTRecommendVideoCell
            if cell == nil
            {
                cell = ETTRecommendVideoCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedRecommendVideoId)
            }
            
            cell?.recommendModel = recommendDataArray[indexPath.item] as? ETTRecommendModel
            
            return cell!
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        let recommendModel = recommendDataArray[indexPath.item] as! ETTRecommendModel;
        
        if recommendModel.imagecount! > 0 || recommendModel.videoTotalTime != nil
        {
            return 300;
        } else
        {
            return 120;
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) 
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
