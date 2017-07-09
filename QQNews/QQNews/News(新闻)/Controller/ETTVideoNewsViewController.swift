//
//  ETTVideoNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/26.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import MJRefresh

class ETTVideoNewsViewController: ETTViewController,UITableViewDataSource,UITableViewDelegate {

    var VTableView:UITableView?
    var videoDataArray = NSMutableArray();
    
    
    let reusedIdentifiyVideo:String = "reusedIdentifiyVideo";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews();
        self.refreshGetNewData()
        
    }
    
    func refreshGetNewData() -> Void
    {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(networkRequest))
        header?.setTitle("下拉刷新", for: MJRefreshState.idle)
        header?.setTitle("松手刷新", for: MJRefreshState.pulling)
        header?.setTitle("加载中...", for: MJRefreshState.refreshing)
        header?.beginRefreshing()
        self.VTableView?.mj_header = header
    }
    
    @objc func networkRequest() -> Void
    {
        print("开始刷新")
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
            newsViewModel.getVideoNewsData(videoNewsCallBack: { (dataArray) in
                for item in dataArray
                {
                    self.videoDataArray.insert(item, at: 0)
                }
                self.VTableView?.reloadData()
            })
            self.VTableView?.mj_header.endRefreshing()
        }
    }
    
    

    func setupSubviews() -> Void 
    {
        VTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64 - 50));
        VTableView?.delegate = self;
        VTableView?.dataSource = self;
        VTableView?.register(ETTVideoNewsCell.self, forCellReuseIdentifier: reusedIdentifiyVideo);
        VTableView?.backgroundColor = UIColor.white;
        self.view.addSubview(VTableView!);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return videoDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedIdentifiyVideo) as? ETTVideoNewsCell;
        if cell == nil
        {
            cell = ETTVideoNewsCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedIdentifiyVideo);
        }
        cell?.videoNewsModel = videoDataArray[indexPath.item] as? ETTVideoNewsModel;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 300;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
