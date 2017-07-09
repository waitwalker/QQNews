//
//  ETTMovieViewController.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/9.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import MJRefresh

class ETTMovieViewController: ETTViewController,UITableViewDataSource,UITableViewDelegate {
    
    var NTableView:UITableView?
    var NDataArray = NSMutableArray();
    
    let DataBase = ETTDataBase.sharedInstance
    
    
    let reusedNTextId:String = "reusedNCellId"
    let reusedNPictureId:String = "reusedNPictureId"
    let reusedNVideoId:String = "reusedNVideoId"
    
    
    
    
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
        let dataArr = DataBase.queryObject()
        
        if (dataArr.count > 0) {
            
            //recommendDataArray = dataArr;
            for item:ETTRecommendModel in dataArr
            {
                NDataArray.add(item)
            }
            NTableView?.reloadData()
        } else
        {
            self.refreshGetNewData()
        }
        
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
        
        NTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64 - 50))
        NTableView?.delegate = self
        NTableView?.dataSource = self
        NTableView?.register(ETTNewsTextCell.self, forCellReuseIdentifier: reusedNTextId)
        NTableView?.register(ETTNewsPictureCell.self, forCellReuseIdentifier: reusedNPictureId)
        NTableView?.register(ETTNewsVideoCell.self, forCellReuseIdentifier: reusedNVideoId)
        self.view.addSubview(NTableView!)
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
        self.NTableView?.mj_header = header
    }
    
    @objc func networkRequest() -> Void
    {
        print("开始刷新")
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
            newsViewModel.getBeijingData(callBack: { (dataArray) in
                
                for item in dataArray
                {
                    self.NDataArray.insert(item, at: 0)
                }
                
                self.NTableView?.reloadData()
            })
            
            self.NTableView?.mj_header.endRefreshing()
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
        return NDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let beijingNewsModel = NDataArray[indexPath.item] as! ETTNewsModel;
        if beijingNewsModel.videoTotalTime == nil
        {
            if beijingNewsModel.imagecount! > 0
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedNPictureId) as? ETTNewsPictureCell
                if cell == nil
                {
                    cell = ETTNewsPictureCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedNPictureId)
                }
                cell?.beijingNewsModel = NDataArray[indexPath.item] as? ETTNewsModel
                
                return cell!
            } else
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedNTextId) as? ETTNewsTextCell
                if cell == nil
                {
                    cell = ETTNewsTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedNTextId)
                }
                cell?.beijingNewsModel = NDataArray[indexPath.item] as? ETTNewsModel
                
                return cell!
            }
        } else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: reusedNVideoId) as? ETTNewsVideoCell
            if cell == nil
            {
                cell = ETTNewsVideoCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedNVideoId)
            }
            
            cell?.beijingNewsModel = NDataArray[indexPath.item] as? ETTNewsModel
            
            return cell!
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let beijingNewsModel = NDataArray[indexPath.item] as! ETTNewsModel;
        
        if beijingNewsModel.imagecount! > 0 || beijingNewsModel.videoTotalTime != nil
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

