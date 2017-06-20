//
//  ETTMeHeaderCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/19.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeHeaderCell: ETTTableViewCell {
    
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
    
    
    
    
    
    
    
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews();
    }
    
    func setupSubviews() -> Void 
    {
        backgroundImageView = UIImageView(frame: self.contentView.bounds);
        backgroundImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(backgroundImageView!);
        
        //let tapGest:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(loginAction(tapGesture: UITapGestureRecognizer)));
        
        
        let headerImageViewWidthHeight:CGFloat = 40.0;
        let headerImageViewX = kMargin;
        let headerImageViewY = ((backgroundImageView?.frame.size.height)! - headerImageViewWidthHeight) / 2.0;
        headerImageView = UIImageView(frame: CGRect(x: headerImageViewX, y: headerImageViewY, width: headerImageViewWidthHeight, height: headerImageViewWidthHeight));
        headerImageView?.layer.cornerRadius = 20.0;
        headerImageView?.clipsToBounds = true;
        headerImageView?.isUserInteractionEnabled = true;
        headerImageView?.addSubview(headerImageView!);
        
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
    
    func loginAction(tapGesture:UITapGestureRecognizer) -> Void 
    {
        NSLog("点击登录");
    }
    
    required init?(coder aDecoder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
