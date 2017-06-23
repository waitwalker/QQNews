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
    let reusedImportNewsPictureId = "ImportNewsPictureCell";
    let reusedImportNewsVideoId = "reusedImportNewsVideoId";
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        self.setupSubviews();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSubviews() -> Void 
    {
        importTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height));
        importTableView?.delegate = self;
        importTableView?.dataSource = self;
//        importTableView?.register(ETTImportNewsTextCell.self, forCellReuseIdentifier: reusedImportNewsTextId);
//        importTableView?.register(ETTImportNewsPictureCell.self, forCellReuseIdentifier: reusedImportNewsPictureId);
        importTableView?.register(ETTImportNewsVideoCell.self, forCellReuseIdentifier: reusedImportNewsVideoId);
        self.view.addSubview(importTableView!);
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
