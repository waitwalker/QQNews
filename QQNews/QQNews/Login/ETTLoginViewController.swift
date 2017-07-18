//
//  ETTLoginViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/21.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTLoginViewController: ETTViewController {
    
    var QQContentView:UIButton?
    var WeChatContentView:UIButton?
    var QQImageView:UIImageView?
    var QQLabel:UILabel?
    var WeChatImageView:UIImageView?
    var WeChatLabel:UILabel?
    
    
    
    
    
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        self.setupSubviews();
        
        self.addTapGesture();
    }
    
    // MARK: - 添加子控件
    func setupSubviews() -> Void 
    {
        let titleLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: kScreenWidth / 2.0, height: 40));
        let centerX:CGFloat = self.view.center.x;
        let centerY:CGFloat = titleLabel.center.y;
        titleLabel.text = "登录";
        titleLabel.textColor = UIColor.black;
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.center = CGPoint(x: centerX, y: centerY);
        self.view.addSubview(titleLabel);
        
        let button = UIButton(frame: CGRect(x: kScreenWidth - 40, y: 20, width: 40, height: 20));
        button.setTitle("返回", for: UIControlState.normal);
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismissAction(button:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button);
        
        let lineView:UIView = UIView(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: 0.5));
        lineView.backgroundColor = UIColor.black.withAlphaComponent(0.5);
        self.view.addSubview(lineView);
        
        
        let headerImageViewWidthHeight:CGFloat = 80.0;
        let headerImageViewX = (kScreenWidth - headerImageViewWidthHeight) / 2.0;
        let headerImageView:UIImageView = UIImageView(frame: CGRect(x: headerImageViewX, y: 150, width: headerImageViewWidthHeight, height: headerImageViewWidthHeight));
        headerImageView.image = UIImage(named: "night-mine_face");
        self.view.addSubview(headerImageView);
        
        let supportLabelWidth:CGFloat = 200.0;
        let supportLabelX = (kScreenWidth - supportLabelWidth) / 2.0;
        let supportLabelY = headerImageView.frame.maxY + 20.0;
        let supportLabelHeight:CGFloat = 30.0;
        let supportLabel:UILabel = UILabel(frame: CGRect(x: supportLabelX, y: supportLabelY, width: supportLabelWidth, height: supportLabelHeight));
        supportLabel.text = "支持QQ或微信登录";
        supportLabel.font = UIFont.systemFont(ofSize: 15.0);
        supportLabel.textColor = kColor(r: 202.0, g: 202.0, b: 202.0);
        supportLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(supportLabel);
        
        let QQContentViewX:CGFloat = 80.0;
        let QQContentViewWidth:CGFloat = kScreenWidth - 2 * 80.0;
        let QQContentViewHeight:CGFloat = 50.0;
        let QQContentViewY:CGFloat = supportLabel.frame.maxY + 50.0;
        QQContentView = UIButton(frame: CGRect(x: QQContentViewX, y: QQContentViewY, width: QQContentViewWidth, height: QQContentViewHeight));
        QQContentView?.backgroundColor = kColor(r: 38.0, g: 184.0, b: 242.0);
        QQContentView?.isUserInteractionEnabled = true;
        QQContentView?.addTarget(self, action: #selector(QQLoginAction(button:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(QQContentView!);
        
        let QQImageViewX:CGFloat = 70.0;
        let QQImageViewY:CGFloat = 10.0;
        let QQImageViewWidth:CGFloat = 30.0;
        let QQImageViewHeight:CGFloat = 30.0;
        QQImageView = UIImageView(frame: CGRect(x: QQImageViewX, y: QQImageViewY, width: QQImageViewWidth, height: QQImageViewHeight));
        QQImageView?.backgroundColor = UIColor.white;
        QQImageView?.isUserInteractionEnabled = true;
        QQContentView?.addSubview(QQImageView!);
        
        let QQLabelWidth:CGFloat = 100.0;
        let QQLabelX:CGFloat = QQContentViewWidth - QQLabelWidth - 50.0;
        let QQLabelY:CGFloat = 10.0;
        let QQLabelHeight:CGFloat = 30.0;
        QQLabel = UILabel(frame: CGRect(x: QQLabelX, y: QQLabelY, width: QQLabelWidth, height: QQLabelHeight));
        QQLabel?.text = "QQ登录";
        QQLabel?.textColor = UIColor.white;
        QQLabel?.textAlignment = NSTextAlignment.center;
        QQLabel?.font = UIFont.systemFont(ofSize: 20.0);
        QQContentView?.addSubview(QQLabel!);
        
        let WeChatContentViewX:CGFloat = 80.0;
        let WeChatContentViewWidth:CGFloat = kScreenWidth - 2 * 80.0;
        let WeChatContentViewHeight:CGFloat = 50.0;
        let WeChatContentViewY:CGFloat = QQContentView!.frame.maxY + 20.0;
        WeChatContentView = UIButton(frame: CGRect(x: WeChatContentViewX, y: WeChatContentViewY, width: WeChatContentViewWidth, height: WeChatContentViewHeight));
        WeChatContentView?.addTarget(self, action: #selector(WeChatLoginAction(button:)), for: UIControlEvents.touchUpInside);
        WeChatContentView?.backgroundColor = kColor(r: 78.0, g: 191.0, b: 82.0);
        self.view.addSubview(WeChatContentView!);
        
        let WeChatImageViewX:CGFloat = 70.0;
        let WeChatImageViewY:CGFloat = 10.0;
        let WeChatImageViewWidth:CGFloat = 30.0;
        let WeChatImageViewHeight:CGFloat = 30.0;
        WeChatImageView = UIImageView(frame: CGRect(x: WeChatImageViewX, y: WeChatImageViewY, width: WeChatImageViewWidth, height: WeChatImageViewHeight));
        WeChatImageView?.backgroundColor = UIColor.white;
        WeChatImageView?.isUserInteractionEnabled = true;
        WeChatContentView?.addSubview(WeChatImageView!);
        
        let WeChatLabelWidth:CGFloat = 100.0;
        let WeChatLabelX:CGFloat = WeChatContentViewWidth - WeChatLabelWidth - 50.0;
        let WeChatLabelY:CGFloat = 10.0;
        let WeChatLabelHeight:CGFloat = 30.0;
        WeChatLabel = UILabel(frame: CGRect(x: WeChatLabelX, y: WeChatLabelY, width: WeChatLabelWidth, height: WeChatLabelHeight));
        WeChatLabel?.text = "微信登录";
        WeChatLabel?.textColor = UIColor.white;
        WeChatLabel?.textAlignment = NSTextAlignment.center;
        WeChatLabel?.font = UIFont.systemFont(ofSize: 20.0);
        WeChatContentView?.addSubview(WeChatLabel!);
    }
    
    // MARK: - 手势
    func addTapGesture() -> Void 
    {
        let QQTapGesture = UITapGestureRecognizer(target: self, action: #selector(QQTapAction(tap:)));
        QQContentView?.addGestureRecognizer(QQTapGesture)
        QQImageView?.addGestureRecognizer(QQTapGesture)
        QQLabel?.addGestureRecognizer(QQTapGesture)
        
        let WeChatGesture = UITapGestureRecognizer(target: self, action: #selector(WeChatAction(tap:)))
        WeChatContentView?.addGestureRecognizer(WeChatGesture)
        WeChatImageView?.addGestureRecognizer(WeChatGesture)
        WeChatLabel?.addGestureRecognizer(WeChatGesture)
        
    }
    
    // MARK: - QQ登录手势事件回调
    @objc func QQTapAction(tap:UITapGestureRecognizer) -> Void 
    {
        print("QQ Login")
    }
    
    // MARK: - 微信登录手势事件回调
    @objc func WeChatAction(tap:UITapGestureRecognizer) -> Void 
    {
        print("WeChat Login")
    }
    
    @objc func QQLoginAction(button:UIButton) -> Void 
    {
        print("QQ Login")
    }
    
    @objc func WeChatLoginAction(button:UIButton) -> Void 
    {
        print("WeChat Login")
    }
    
    func setupNavigationBarItem() -> Void 
    {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30));
        button.setTitle("返回", for: UIControlState.normal);
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        button.addTarget(self, action: #selector(dismissAction(button:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button);
    }
    
    @objc func dismissAction(button:UIButton) -> Void 
    {
        self.dismiss(animated: true) { 
            print("dismiss 成功");
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
