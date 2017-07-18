//
//  ETTChoiceLiveViewController.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import MJRefresh

class ETTChoiceLiveViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var choiceTableView:UITableView?
    
    let reusedChoiceId:String = "reusedChoiceId"
    
    let choiceDataArray = NSMutableArray()
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupSubview()
        
        self.refreshGetNewData()
    }
    
    // MARK: - 初始化子控件
    func setupSubview() -> Void
    {
        choiceTableView = UITableView(frame: self.view.bounds)
        choiceTableView?.delegate = self
        choiceTableView?.dataSource = self
        choiceTableView?.register(ETTLiveCell.self, forCellReuseIdentifier: reusedChoiceId)
        self.view.addSubview(choiceTableView!)
    }
    
    // MARK: - 刷新获取新数据
    func refreshGetNewData() -> Void 
    {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(networkRequest))
        header?.setTitle("下拉刷新", for: MJRefreshState.idle)
        header?.setTitle("松手刷新", for: MJRefreshState.pulling)
        header?.setTitle("加载中...", for: MJRefreshState.refreshing)
        header?.beginRefreshing()
        self.choiceTableView?.mj_header = header
    }
    
    // MARK: - 发送网络请求获取新数据
    @objc func networkRequest() -> Void
    {
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        let queue = DispatchQueue.init(label: "com.etiantian.queue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.never, target: nil)
        
        liveViewModel.getChoiceData(callBack: { (dataArray) in
            for item in dataArray
            {
                self.choiceDataArray.insert(item, at: 0)
            }
            DispatchQueue.main.async
                {
                    self.choiceTableView?.reloadData()
                    self.choiceTableView?.mj_header.endRefreshing()
            }
            
        })
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.choiceDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedChoiceId) as? ETTLiveCell
        if cell == nil
        {
            cell = ETTLiveCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedChoiceId)
        }
        cell?.choiceLiveModel = (self.choiceDataArray[indexPath.item] as! ETTLiveModel)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
