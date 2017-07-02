//
//  ETTImportNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/23.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

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
        self.getImportNewsList();
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
        importTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height));
        importTableView?.delegate = self;
        importTableView?.dataSource = self;
        importTableView?.register(ETTImportNewsTextCell.self, forCellReuseIdentifier: reusedImportNewsTextId);
        importTableView?.register(ETTImportNewsPictureCell.self, forCellReuseIdentifier: reusedImportNewsPictureId);
        importTableView?.register(ETTImportNewsVideoCell.self, forCellReuseIdentifier: reusedImportNewsVideoId);
        self.view.addSubview(importTableView!);
        
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
        /*
         注意一下 需要替换3个位置 上下两个id 中间cell
         */
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedImportNewsTextId) as? ETTImportNewsTextCell;
        if cell == nil
        {
            cell = ETTImportNewsTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedImportNewsTextId);
        }
        
        cell?.importNewsModel = (importNewsListArry[indexPath.item] as! ETTImportNewsModel);
        
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 120.0;
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
