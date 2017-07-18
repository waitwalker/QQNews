//
//  ETTEntertainmentLViewController.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/18.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import MJRefresh

class ETTEntertainmentLViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource {

    var entertainmentTableView:UITableView?
    
    let reusedEntertainmentId:String = "reusedentertainmentId"
    
    let entertainmentDataArray = NSMutableArray()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupSubview()
        
        self.refreshGetNewData()
    }
    
    // MARK: - 初始化子控件
    func setupSubview() -> Void
    {
        entertainmentTableView = UITableView(frame: self.view.bounds)
        entertainmentTableView?.delegate = self
        entertainmentTableView?.dataSource = self
        entertainmentTableView?.register(ETTLiveCell.self, forCellReuseIdentifier: reusedEntertainmentId)
        self.view.addSubview(entertainmentTableView!)
    }
    
    // MARK: - 刷新获取新数据
    func refreshGetNewData() -> Void
    {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(networkRequest))
        header?.setTitle("下拉刷新", for: MJRefreshState.idle)
        header?.setTitle("松手刷新", for: MJRefreshState.pulling)
        header?.setTitle("加载中...", for: MJRefreshState.refreshing)
        header?.beginRefreshing()
        self.entertainmentTableView?.mj_header = header
    }
    
    // MARK: - 发送网络请求获取新数据
    @objc func networkRequest() -> Void
    {
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        let queue = DispatchQueue.init(label: "com.etiantian.queue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.never, target: nil)
        
        liveViewModel.getEntertainmentData(callBack: { (dataArray) in
            for item in dataArray
            {
                self.entertainmentDataArray.insert(item, at: 0)
            }
            DispatchQueue.main.async
                {
                    self.entertainmentTableView?.reloadData()
                    self.entertainmentTableView?.mj_header.endRefreshing()
            }
            
        })
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.entertainmentDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedEntertainmentId) as? ETTLiveCell
        if cell == nil
        {
            cell = ETTLiveCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedEntertainmentId)
        }
        cell?.entertainmentLiveModel = (self.entertainmentDataArray[indexPath.item] as! ETTLiveModel)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
