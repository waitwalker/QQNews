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
    let reusedImportId:String = "reusedImportId";
    
    
    
    override init(frame: CGRect) 
    {
        super.init(frame: frame);
        self.setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void 
    {
        importTableView = UITableView.init(frame: self.bounds);
        importTableView?.delegate = self;
        importTableView?.dataSource = self;
        importTableView?.register(ETTImportNewsTextCell.self, forCellReuseIdentifier: reusedImportId);
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
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportId);
        if cell == nil
        {
            cell = ETTImportNewsTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell");
        }
        
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 110.0;
    }
    
}
