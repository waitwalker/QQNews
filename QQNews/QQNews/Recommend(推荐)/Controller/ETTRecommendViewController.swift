//
//  ETTRecommendViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

/*
     推荐里面用的是要闻类型的cell
 */

import UIKit

class ETTRecommendViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource 
{
    var recommendTableView:UITableView?
    
    let reusedRecommendCellId:String = "reusedRecommendCellId"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setupSubviews()
        
    }
    
    func setupSubviews() -> Void 
    {
        recommendTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        recommendTableView?.delegate = self
        recommendTableView?.dataSource = self
        recommendTableView?.register(ETTRecommendTextCell.self, forCellReuseIdentifier: reusedRecommendCellId)
        self.view.addSubview(recommendTableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedRecommendCellId) as? ETTImportNewsTextCell
        if cell == nil
        {
            cell = ETTImportNewsTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedRecommendCellId)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 120;
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
