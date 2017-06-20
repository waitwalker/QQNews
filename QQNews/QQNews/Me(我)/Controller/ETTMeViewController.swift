//
//  ETTMeViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    let reusedIdentify:String = "meReusedIdentify";
    var meTableView:UITableView?
    var dataArray:NSMutableArray = NSMutableArray();
    
    let kMargin:CGFloat = 20.0 * (414 / kScreenWidth);
    let kBarHeightMargin:CGFloat = 5.0;
    let kTextLabelFont:CGFloat = 8.0;
    let kTextLabelTextColor:UIColor = UIColor.white;
    let kTextLabelAlignmentCenter:NSTextAlignment = NSTextAlignment.center;
    let kBarImageViewWidthHeight:CGFloat = 34.0;
    
    var backgroundImageView:UIImageView?
    var headerImageView:UIImageView?
    var titleLabel:UILabel?
    var subTitleLabel:UILabel?
    var subArrowImageView:UIImageView?
    var barContentView:UIView?
    var dayNightImageView:UIImageView?
    var dayNightLabel:UILabel?
    var imageTextImageView:UIImageView?
    var imageTextLabel:UILabel?
    var offlineImageView:UIImageView?
    var offlineLabel:UILabel?
    
    var isLogin:Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        self.setupSubviews();
        self.getData()
    }
    
    func setupHeaderView() -> Void
    {
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: -250, width: kScreenWidth, height: 250));
        backgroundImageView?.isUserInteractionEnabled = true;
        backgroundImageView!.contentMode = .scaleAspectFill;
        backgroundImageView?.backgroundColor = UIColor.blue;
        meTableView?.addSubview(backgroundImageView!);
        
        //let tapGest:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(loginAction(tapGesture: UITapGestureRecognizer)));
        
        
        let headerImageViewWidthHeight:CGFloat = 40.0;
        let headerImageViewX = kMargin;
        let headerImageViewY = ((backgroundImageView?.frame.size.height)! - headerImageViewWidthHeight) / 2.0;
        headerImageView = UIImageView(frame: CGRect(x: headerImageViewX, y: headerImageViewY, width: headerImageViewWidthHeight, height: headerImageViewWidthHeight));
        headerImageView?.layer.cornerRadius = 20.0;
        headerImageView?.clipsToBounds = true;
        headerImageView?.isUserInteractionEnabled = true;
        headerImageView?.backgroundColor = UIColor.red;
        backgroundImageView?.addSubview(headerImageView!);
        
        let titleLabelHeight:CGFloat = 25.0;
        let titleLabelX:CGFloat = (backgroundImageView?.frame.maxX)!;
        let titleLabelWidth:CGFloat = kScreenWidth - (headerImageView?.frame.maxX)! - 2 * kMargin;
        let titleLabelY:CGFloat = ((backgroundImageView?.frame.size.height)! - titleLabelHeight) / 2.0;
        titleLabel = UILabel(frame: CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelWidth, height: titleLabelHeight));
        titleLabel?.font = UIFont.systemFont(ofSize: 15.0);
        titleLabel?.textColor = UIColor.white;
        titleLabel?.textAlignment = NSTextAlignment.left;
        backgroundImageView?.addSubview(titleLabel!);
        
        let subTitleLabelX:CGFloat = (titleLabel?.frame.origin.x)!;
        let subTitleLabelHeight:CGFloat = 15.0;
        let subTitleLabelWidth:CGFloat = 120.0;
        let subTitleLabelY:CGFloat = (titleLabel?.frame.maxY)!;
        subTitleLabel = UILabel(frame: CGRect(x: subTitleLabelX, y: subTitleLabelY, width: subTitleLabelWidth, height: subTitleLabelHeight));
        subTitleLabel?.font = UIFont.systemFont(ofSize: 12.0);
        subTitleLabel?.textColor = UIColor.white;
        subTitleLabel?.textAlignment = NSTextAlignment.left;
        subTitleLabel?.isHidden = true;
        backgroundImageView?.addSubview(subTitleLabel!);
        
        let barContentViewX:CGFloat = 0.0;
        let barContentViewHeight:CGFloat = 64.0;
        let barContentViewWidth:CGFloat = kScreenWidth;
        let barContentViewY:CGFloat = (backgroundImageView?.frame.size.height)! - barContentViewHeight;
        barContentView = UIView(frame: CGRect(x: barContentViewX, y: barContentViewY, width: barContentViewWidth, height: barContentViewHeight));
        barContentView?.backgroundColor = UIColor.black.withAlphaComponent(0.2);
        backgroundImageView?.addSubview(barContentView!);
        
        let imageTextImageViewWidthHeight:CGFloat = kBarImageViewWidthHeight;
        let imageTextImageViewX:CGFloat = (kScreenWidth - imageTextImageViewWidthHeight) / 2.0;
        let imageTextImageViewY:CGFloat = kBarHeightMargin;
        imageTextImageView = UIImageView(frame: CGRect(x: imageTextImageViewX, y: imageTextImageViewY, width: imageTextImageViewWidthHeight, height: imageTextImageViewWidthHeight));
        imageTextImageView?.isUserInteractionEnabled = true;
        barContentView?.addSubview(imageTextImageView!);
        
        let imageTextLabelWidth:CGFloat = 80.0;
        let imageTextLabelHeight:CGFloat = 15.0;
        let imageTextLabelX:CGFloat = (kScreenWidth - imageTextLabelWidth) / 2.0;
        let imageTextLabelY:CGFloat = (imageTextImageView?.frame.maxY)! + kBarHeightMargin;
        imageTextLabel = UILabel(frame: CGRect(x: imageTextLabelX, y: imageTextLabelY, width: imageTextLabelWidth, height: imageTextLabelHeight));
        imageTextLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        imageTextLabel?.textAlignment = kTextLabelAlignmentCenter;
        imageTextLabel?.textColor = kTextLabelTextColor;
        barContentView?.addSubview(imageTextLabel!);
        
        let dayNightLabelX:CGFloat = 12 * kBarHeightMargin;
        let dayNightLabelY:CGFloat = (imageTextLabel?.frame.origin.y)!;
        let dayNightLabelHeight:CGFloat = imageTextLabelHeight;
        let dayNightLabelWidth:CGFloat = imageTextLabelWidth;
        
        dayNightLabel = UILabel(frame:CGRect(x: dayNightLabelX, y: dayNightLabelY, width: dayNightLabelWidth, height: dayNightLabelHeight));
        dayNightLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        dayNightLabel?.textColor = kTextLabelTextColor;
        dayNightLabel?.textAlignment = kTextLabelAlignmentCenter;
        barContentView?.addSubview(dayNightLabel!);
        
        let dayNightImageViewWidth:CGFloat = kBarImageViewWidthHeight;
        let dayNightImageViewHeight:CGFloat = kBarImageViewWidthHeight;
        let dayNightImageViewY:CGFloat = imageTextImageViewY;
        let dayNightImageViewX:CGFloat = 80.0;
        dayNightImageView = UIImageView(frame: CGRect(x: dayNightImageViewX, y: dayNightImageViewY, width: dayNightImageViewWidth, height: dayNightImageViewHeight));
        dayNightImageView?.isUserInteractionEnabled = true;
        let dayNightImageViewCenterY:CGFloat = (dayNightImageView?.center.y)!;
        let dayNightImageViewCenterX:CGFloat = (dayNightLabel?.center.x)!;
        dayNightImageView?.center = CGPoint(x: dayNightImageViewCenterX, y: dayNightImageViewCenterY);
        barContentView?.addSubview(dayNightImageView!);
        
        let offlineLabelWidth:CGFloat = imageTextLabelWidth;
        let offlineLabelHeight:CGFloat = imageTextLabelHeight;
        let offlineLabelX:CGFloat = kScreenWidth - 12 * kMargin - offlineLabelWidth;
        let offlineLabelY:CGFloat = imageTextLabelY;
        offlineLabel = UILabel(frame: CGRect(x: offlineLabelX, y: offlineLabelY, width: offlineLabelWidth, height: offlineLabelHeight));
        offlineLabel?.textAlignment = kTextLabelAlignmentCenter;
        offlineLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        offlineLabel?.textColor = kTextLabelTextColor;
        barContentView?.addSubview(offlineLabel!);
        
        let offlineImageViewX:CGFloat = kScreenWidth - 80.0;
        let offlineImageViewY:CGFloat = imageTextLabelY;
        let offlineImageViewWidth:CGFloat = kBarImageViewWidthHeight;
        let offlineImageViewHeight:CGFloat = kBarImageViewWidthHeight;
        offlineImageView = UIImageView(frame: CGRect(x: offlineImageViewX, y: offlineImageViewY, width: offlineImageViewWidth, height: offlineImageViewHeight));
        offlineImageView?.isUserInteractionEnabled = true;
        let offlineImageViewCenterX:CGFloat = (offlineLabel?.center.x)!;
        let offlineImageViewCenterY:CGFloat = dayNightImageViewCenterY;
        offlineImageView?.center = CGPoint(x: offlineImageViewCenterX, y: offlineImageViewCenterY);
        
        barContentView?.addSubview(offlineImageView!);
    }
    
    func setupSubviews() -> Void 
    {
        meTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
        meTableView?.register(ETTMeCell.self, forCellReuseIdentifier: reusedIdentify);
        meTableView?.delegate   = self;
        meTableView?.dataSource = self;
        self.view.addSubview(meTableView!);
        self.setupHeaderView();
        meTableView?.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView .isKind(of: UITableView.self)
        {
            let offsetY:CGFloat = scrollView.contentOffset.y
            if offsetY < 0
            {
                print(offsetY);
                var frame:CGRect = (backgroundImageView?.frame)!;
                print("加了之前",frame);
                frame.size.height = -offsetY - 20;
                print("加了以后",frame);
                backgroundImageView?.frame = frame;
            } else
            {
                print("正的",offsetY)
                
            }
            
            
            
            
        }
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
