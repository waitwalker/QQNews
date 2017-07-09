//
//  ETTImportNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/23.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import MJRefresh

class ETTImportNewsViewController: ETTViewController,UITableViewDataSource,UITableViewDelegate {

    var importTableView:UITableView?
    let reusedImportNewsTextId:String = "reusedImportId";
    let reusedImportNewsPictureId:String = "ImportNewsPictureCell";
    let reusedImportNewsVideoId:String = "reusedImportNewsVideoId";
    
    var importNewsListArry = NSMutableArray();
    
    
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        //初始化控件
        self.setupSubviews();
        
        //获取数据
        //self.getImportNewsList();
        self.refreshGetNewData()
    }

    func getImportNewsList() -> Void
    {
        newsViewModel.getImportNewsListData { (dataArray) in
            self.importNewsListArry = dataArray;
            
            self.importTableView?.reloadData();
        }
    }
    
    func setupSubviews() -> Void 
    {
        importTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64 - 50));
        importTableView?.delegate = self;
        importTableView?.dataSource = self;
        importTableView?.register(ETTImportNewsTextCell.self, forCellReuseIdentifier: reusedImportNewsTextId);
        importTableView?.register(ETTImportNewsPictureCell.self, forCellReuseIdentifier: reusedImportNewsPictureId);
        importTableView?.register(ETTImportNewsVideoCell.self, forCellReuseIdentifier: reusedImportNewsVideoId);
        self.view.addSubview(importTableView!);
        
    }
    func refreshGetNewData() -> Void
    {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(networkRequest))
        header?.setTitle("下拉刷新", for: MJRefreshState.idle)
        header?.setTitle("松手刷新", for: MJRefreshState.pulling)
        header?.setTitle("加载中...", for: MJRefreshState.refreshing)
        header?.beginRefreshing()
        self.importTableView?.mj_header = header
    }
    
    @objc func networkRequest() -> Void
    {
        print("开始刷新")
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
            newsViewModel.getImportNewsListData(callBack: { (dataArray) in
                for item in dataArray
                {
                    self.importNewsListArry.insert(item, at: 0)
                }
                self.importTableView?.reloadData()
            })
            
            self.importTableView?.mj_header.endRefreshing()
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return importNewsListArry.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        
        let imaportNewsModel = importNewsListArry[indexPath.item] as! ETTImportNewsModel;
        if imaportNewsModel.videoTotalTime == nil
        {
            if imaportNewsModel.imagecount! > 0
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportNewsPictureId) as? ETTImportNewsPictureCell
                if cell == nil
                {
                    cell = ETTImportNewsPictureCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedImportNewsPictureId)
                }
                cell?.importNewsModel = importNewsListArry[indexPath.item] as? ETTImportNewsModel
                
                return cell!
            } else
            {
                var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportNewsTextId) as? ETTImportNewsTextCell
                if cell == nil
                {
                    cell = ETTImportNewsTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedImportNewsTextId)
                }
                cell?.importNewsModel = importNewsListArry[indexPath.item] as? ETTImportNewsModel
                
                return cell!
            }
        } else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportNewsVideoId) as? ETTImportNewsVideoCell
            if cell == nil
            {
                cell = ETTImportNewsVideoCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedImportNewsVideoId)
            }
            
            cell?.importNewsModel = importNewsListArry[indexPath.item] as? ETTImportNewsModel
            
            return cell!
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let importNewsModel = importNewsListArry[indexPath.item] as! ETTImportNewsModel;
        
        if importNewsModel.imagecount! > 0 || importNewsModel.videoTotalTime != nil
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
