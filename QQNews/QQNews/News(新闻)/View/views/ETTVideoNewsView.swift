//
//  ETTVideoNewsView.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/23.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTVideoNewsView: ETTView,UITableViewDelegate,UITableViewDataSource {

    var videoTableView:UITableView?
    
    
    let reusedVideoNewsId:String = "reusedVideoNewsId";
    
    
    
    override init(frame: CGRect) 
    {
        super.init(frame: frame)
        //self.setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void 
    {
        videoTableView = UITableView(frame: self.bounds);
        videoTableView?.delegate = self;
        videoTableView?.dataSource = self;
        videoTableView?.register(ETTVideoNewsCell.self, forCellReuseIdentifier: reusedVideoNewsId);
        self.addSubview(videoTableView!);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedVideoNewsId);
        if cell == nil 
        {
            cell = ETTVideoNewsCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedVideoNewsId);
        }
        cell?.textLabel?.text = String.init(format: "第%ld行", indexPath.item);
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 300.0;
    }
    
}
