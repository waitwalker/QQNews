//
//  ETTChoiceLiveViewController.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTChoiceLiveViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var choiceTableView:UITableView?
    
    let reusedChoiceId:String = "reusedChoiceId"
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupSubview()
    }
    
    // MARK: - 初始化子控件
    func setupSubview() -> Void
    {
        choiceTableView = UITableView(frame: self.view.bounds)
        choiceTableView?.delegate = self
        choiceTableView?.dataSource = self
        choiceTableView?.register(ETTLiveCell.self, forCellReuseIdentifier: reusedChoiceId)
        self.view.addSubview(choiceTableView!)
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
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedChoiceId) as? ETTLiveCell
        if cell == nil
        {
            cell = ETTLiveCell.init(style: UITableViewCellStyle.default, reuseIdentifier: reusedChoiceId)
        }
        cell?.textLabel?.text = String(format: "%d", indexPath.item)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 240
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
