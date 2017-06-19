//
//  ETTMeViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource {
    
    let reusedIdentify:String = "meReusedIdentify";
    
    var meTableView:UITableView?
    
    var dataArray:NSMutableArray = NSMutableArray();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setupSubviews();
        self.getData()
    }
    
    func setupSubviews() -> Void 
    {
        meTableView = UITableView.init(frame: self.view.bounds);
        meTableView?.register(ETTMeCell.self, forCellReuseIdentifier: reusedIdentify);
        meTableView?.delegate   = self;
        meTableView?.dataSource = self;
        self.view.addSubview(meTableView!);
    }
    
    
    
    /// 获取数据
    func getData() -> Void
    {
        ETTMeViewModel().getMeData { (array) in
            
            dataArray = array;
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = ETTMeCell.init(style: .default, reuseIdentifier: reusedIdentify);
        cell.meModel = dataArray.object(at: indexPath.item) as? ETTMeModel;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell:ETTMeCell = tableView.cellForRow(at: indexPath) as! ETTMeCell;
        cell.badgeImageView?.isHidden = true;
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? 
    {
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250));
        headerView.backgroundColor = UIColor.red;
        return headerView;
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat 
    {
        return 250.0;
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
