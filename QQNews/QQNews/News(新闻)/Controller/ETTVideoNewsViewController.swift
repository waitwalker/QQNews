//
//  ETTVideoNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/26.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTVideoNewsViewController: ETTViewController,UITableViewDataSource,UITableViewDelegate {

    var VTableView:UITableView?
    
    
    let reusedIdentifiyVideo:String = "reusedIdentifiyVideo";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews();
    }

    func setupSubviews() -> Void 
    {
        VTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height));
        VTableView?.delegate = self;
        VTableView?.dataSource = self;
        VTableView?.register(ETTVideoNewsCell.self, forCellReuseIdentifier: reusedIdentifiyVideo);
        VTableView?.backgroundColor = UIColor.orange;
        self.view.addSubview(VTableView!);
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
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedIdentifiyVideo);
        if cell == nil
        {
            cell = ETTVideoNewsCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedIdentifiyVideo);
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 300;
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
