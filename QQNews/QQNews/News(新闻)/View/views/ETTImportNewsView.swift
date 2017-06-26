//
//  ETTNewsView.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/22.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTImportNewsView: ETTView,UITableViewDelegate,UITableViewDataSource {

    var importTableView:UITableView?
    let reusedImportNewsTextId:String = "reusedImportId";
    let reusedImportNewsPictureId = "ImportNewsPictureCell";
    let reusedImportNewsVideoId = "reusedImportNewsVideoId";
    
    
    
    
    override init(frame: CGRect) 
    {
        super.init(frame: frame);
        //self.setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void 
    {
        importTableView = UITableView.init(frame: self.bounds);
        importTableView?.delegate = self;
        importTableView?.dataSource = self;
        importTableView?.register(ETTImportNewsTextCell.self, forCellReuseIdentifier: reusedImportNewsTextId);
        importTableView?.register(ETTImportNewsPictureCell.self, forCellReuseIdentifier: reusedImportNewsPictureId);
        importTableView?.register(ETTImportNewsVideoCell.self, forCellReuseIdentifier: reusedImportNewsVideoId);
        self.addSubview(importTableView!);
        
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
        /*
             注意一下 需要替换3个位置 上下两个id 中间cell
         */
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportNewsVideoId);
        if cell == nil
        {
            cell = ETTImportNewsVideoCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedImportNewsVideoId);
        }
        
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 300.0;
    }
    
}
