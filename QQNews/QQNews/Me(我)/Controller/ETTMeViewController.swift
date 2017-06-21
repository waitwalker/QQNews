//
//  ETTMeViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeViewController: ETTViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    var loginVC:ETTLoginViewController?
    
    let reusedIdentify:String = "meReusedIdentify";
    var meTableView:UITableView?
    var dataArray:NSMutableArray = NSMutableArray();
    
    let kHeaderHeight:CGFloat = 250;
    
    let kMargin:CGFloat = 20.0 * (414 / kScreenWidth);
    let kBarHeightMargin:CGFloat = 5.0;
    let kTextLabelFont:CGFloat = 10.0;
    let kTextLabelTextColor:UIColor = UIColor.white;
    let kTextLabelAlignmentCenter:NSTextAlignment = NSTextAlignment.center;
    let kBarImageViewWidthHeight:CGFloat = 34.0;
    
    var headerContentView:UIView?
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
    var settingImageView:UIImageView?
    
    
    var isLogin:Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        
        self.setupSubviews();
        
        self.getData()
        
        self.addTapGesture();
    }
    
    // MARK: - 初始化头控件
    func setupHeaderView() -> Void
    {
        headerContentView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeaderHeight));
        meTableView?.addSubview(headerContentView!);
        
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeaderHeight));
        backgroundImageView?.isUserInteractionEnabled = true;
        backgroundImageView?.backgroundColor = UIColor.blue;
        headerContentView?.addSubview(backgroundImageView!);
        
        //let tapGest:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(loginAction(tapGesture: UITapGestureRecognizer)));
        
        
        let headerImageViewWidthHeight:CGFloat = 60.0;
        let headerImageViewX = kMargin;
        let headerImageViewY = ((backgroundImageView?.frame.size.height)! - headerImageViewWidthHeight) / 2.0;
        headerImageView = UIImageView(frame: CGRect(x: headerImageViewX, y: headerImageViewY, width: headerImageViewWidthHeight, height: headerImageViewWidthHeight));
        headerImageView?.layer.cornerRadius = 30.0;
        headerImageView?.clipsToBounds = true;
        headerImageView?.isUserInteractionEnabled = true;
        headerImageView?.backgroundColor = UIColor.red;
        headerContentView?.addSubview(headerImageView!);
        
        let titleLabelHeight:CGFloat = 30.0;
        let titleLabelX:CGFloat = (headerImageView?.frame.maxX)! + kMargin / 2.0;
        let titleLabelWidth:CGFloat = kScreenWidth - (headerImageView?.frame.maxX)! - 2 * kBarHeightMargin;
        let titleLabelY:CGFloat = ((backgroundImageView?.frame.size.height)! - titleLabelHeight) / 2.0;
        titleLabel = UILabel(frame: CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelWidth, height: titleLabelHeight));
        titleLabel?.font = UIFont.systemFont(ofSize: 20.0);
        titleLabel?.textColor = UIColor.white;
        titleLabel?.textAlignment = NSTextAlignment.left;
        titleLabel?.text = "点击登录";
        headerContentView?.addSubview(titleLabel!);
        
        let subTitleLabelX:CGFloat = (titleLabel?.frame.origin.x)!;
        let subTitleLabelHeight:CGFloat = 15.0;
        let subTitleLabelWidth:CGFloat = 120.0;
        let subTitleLabelY:CGFloat = (titleLabel?.frame.maxY)!;
        subTitleLabel = UILabel(frame: CGRect(x: subTitleLabelX, y: subTitleLabelY, width: subTitleLabelWidth, height: subTitleLabelHeight));
        subTitleLabel?.font = UIFont.systemFont(ofSize: 12.0);
        subTitleLabel?.textColor = UIColor.white;
        subTitleLabel?.textAlignment = NSTextAlignment.left;
        subTitleLabel?.isHidden = true;
        headerContentView?.addSubview(subTitleLabel!);
        
        let barContentViewX:CGFloat = 0.0;
        let barContentViewHeight:CGFloat = 64.0;
        let barContentViewWidth:CGFloat = kScreenWidth;
        let barContentViewY:CGFloat = (backgroundImageView?.frame.size.height)! - barContentViewHeight;
        barContentView = UIView(frame: CGRect(x: barContentViewX, y: barContentViewY, width: barContentViewWidth, height: barContentViewHeight));
        barContentView?.backgroundColor = UIColor.black.withAlphaComponent(0.2);
        headerContentView?.addSubview(barContentView!);
        
        let imageTextImageViewWidthHeight:CGFloat = kBarImageViewWidthHeight;
        let imageTextImageViewX:CGFloat = (kScreenWidth - imageTextImageViewWidthHeight) / 2.0;
        let imageTextImageViewY:CGFloat = kBarHeightMargin;
        imageTextImageView = UIImageView(frame: CGRect(x: imageTextImageViewX, y: imageTextImageViewY, width: imageTextImageViewWidthHeight, height: imageTextImageViewWidthHeight));
        imageTextImageView?.image = UIImage(named: "night-personal_iocn_tupian");
        imageTextImageView?.isUserInteractionEnabled = true;
        barContentView?.addSubview(imageTextImageView!);
        
        let imageTextLabelWidth:CGFloat = 80.0;
        let imageTextLabelHeight:CGFloat = 15.0;
        let imageTextLabelX:CGFloat = (kScreenWidth - imageTextLabelWidth) / 2.0;
        let imageTextLabelY:CGFloat = (imageTextImageView?.frame.maxY)! + kBarHeightMargin;
        imageTextLabel = UILabel(frame: CGRect(x: imageTextLabelX, y: imageTextLabelY, width: imageTextLabelWidth, height: imageTextLabelHeight));
        imageTextLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        imageTextLabel?.text = "文字模式";
        imageTextLabel?.textAlignment = kTextLabelAlignmentCenter;
        imageTextLabel?.textColor = kTextLabelTextColor;
        barContentView?.addSubview(imageTextLabel!);
        
        let dayNightLabelX:CGFloat = 8 * kBarHeightMargin;
        let dayNightLabelY:CGFloat = (imageTextLabel?.frame.origin.y)!;
        let dayNightLabelHeight:CGFloat = imageTextLabelHeight;
        let dayNightLabelWidth:CGFloat = imageTextLabelWidth;
        
        dayNightLabel = UILabel(frame:CGRect(x: dayNightLabelX, y: dayNightLabelY, width: dayNightLabelWidth, height: dayNightLabelHeight));
        dayNightLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        dayNightLabel?.textColor = kTextLabelTextColor;
        dayNightLabel?.textAlignment = kTextLabelAlignmentCenter;
        dayNightLabel?.text = "夜间模式";
        barContentView?.addSubview(dayNightLabel!);
        
        let dayNightImageViewWidth:CGFloat = kBarImageViewWidthHeight;
        let dayNightImageViewHeight:CGFloat = kBarImageViewWidthHeight;
        let dayNightImageViewY:CGFloat = imageTextImageViewY;
        let dayNightImageViewX:CGFloat = 80.0;
        dayNightImageView = UIImageView(frame: CGRect(x: dayNightImageViewX, y: dayNightImageViewY, width: dayNightImageViewWidth, height: dayNightImageViewHeight));
        dayNightImageView?.isUserInteractionEnabled = true;
        dayNightImageView?.image = UIImage(named: "personal_icon_night");
        let dayNightImageViewCenterY:CGFloat = (dayNightImageView?.center.y)!;
        let dayNightImageViewCenterX:CGFloat = (dayNightLabel?.center.x)!;
        dayNightImageView?.center = CGPoint(x: dayNightImageViewCenterX, y: dayNightImageViewCenterY);
        barContentView?.addSubview(dayNightImageView!);
        
        let offlineLabelWidth:CGFloat = imageTextLabelWidth;
        let offlineLabelHeight:CGFloat = imageTextLabelHeight;
        let offlineLabelX:CGFloat = kScreenWidth - 8 * kBarHeightMargin - offlineLabelWidth;
        let offlineLabelY:CGFloat = imageTextLabelY;
        offlineLabel = UILabel(frame: CGRect(x: offlineLabelX, y: offlineLabelY, width: offlineLabelWidth, height: offlineLabelHeight));
        offlineLabel?.textAlignment = kTextLabelAlignmentCenter;
        offlineLabel?.font = UIFont.systemFont(ofSize: kTextLabelFont);
        offlineLabel?.textColor = kTextLabelTextColor;
        offlineLabel?.text = "离线阅读";
        barContentView?.addSubview(offlineLabel!);
        
        let offlineImageViewX:CGFloat = kScreenWidth - 80.0;
        let offlineImageViewY:CGFloat = imageTextLabelY;
        let offlineImageViewWidth:CGFloat = kBarImageViewWidthHeight;
        let offlineImageViewHeight:CGFloat = kBarImageViewWidthHeight;
        offlineImageView = UIImageView(frame: CGRect(x: offlineImageViewX, y: offlineImageViewY, width: offlineImageViewWidth, height: offlineImageViewHeight));
        offlineImageView?.isUserInteractionEnabled = true;
        offlineImageView?.image = UIImage(named: "personal_icon_night");
        let offlineImageViewCenterX:CGFloat = (offlineLabel?.center.x)!;
        let offlineImageViewCenterY:CGFloat = dayNightImageViewCenterY;
        offlineImageView?.center = CGPoint(x: offlineImageViewCenterX, y: offlineImageViewCenterY);
        offlineImageView?.image = UIImage(named: "personal_icon_offline");
        
        barContentView?.addSubview(offlineImageView!);
    }
    
    func addTapGesture() -> Void 
    {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(tapGesture:)));
        headerImageView?.addGestureRecognizer(tapGesture);
        
        let settingImageViewTap = UITapGestureRecognizer.init(target: self, action: #selector(settingImageViewTapAction(tap:)));
        settingImageView?.addGestureRecognizer(settingImageViewTap)
        
    }
    
    // MARK: - 头像的点击事件回调
    @objc func tapAction(tapGesture:UITapGestureRecognizer) -> Void 
    {
        loginVC = ETTLoginViewController();
        self.present(loginVC!, animated: true, completion: { 
            print("present 成功");
        })
        
    }
    
    // MARK: - 设置图标的点击事件回调
    @objc func settingImageViewTapAction(tap:UITapGestureRecognizer) -> Void 
    {
        print("设置被点击了");
    }
    
    // MARK: - 初始化子控件
    func setupSubviews() -> Void 
    {
        meTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
        meTableView?.register(ETTMeCell.self, forCellReuseIdentifier: reusedIdentify);
        meTableView?.delegate   = self;
        meTableView?.dataSource = self;
        self.view.addSubview(meTableView!);
        self.setupHeaderView();
        meTableView?.tableHeaderView = headerContentView;
        
        
        let settingImageViewWidthHeight:CGFloat = 40.0;
        let settingImageViewY:CGFloat = 70.0;
        let settingImageViewX:CGFloat = kScreenWidth - settingImageViewWidthHeight - 20;
        settingImageView = UIImageView(frame: CGRect(x: settingImageViewX, y: settingImageViewY, width: settingImageViewWidthHeight, height: settingImageViewWidthHeight));
        settingImageView?.isUserInteractionEnabled = true;
        settingImageView?.image = UIImage(named: "userpage_icon_setting_normal");
        self.view.addSubview(settingImageView!);
        
    }
    
    /// 获取数据
    func getData() -> Void
    {
        ETTMeViewModel().getMeData { (array) in
            
            dataArray = array;
        }
        
    }
    
    // MARK: - tableViewDataSource
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
    
    // MARK: - tableView Delegate
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
    
    // MARK: - scrollview Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView .isKind(of: UITableView.self)
        {
            let offsetY:CGFloat = scrollView.contentOffset.y
            if offsetY < 0
            {
                backgroundImageView?.frame = CGRect(x: 0, y: offsetY, width: kScreenWidth, height: kHeaderHeight - offsetY);
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
