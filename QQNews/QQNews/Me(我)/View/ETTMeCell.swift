//
//  ETTMeCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeCell: ETTTableViewCell 
{
    //属性
    var nameLabel:UILabel?
    var badgeImageView:UIImageView?
    var subNameLabel:UILabel?
    var arrowImageView :UIImageView?
    
    let kMargin     = 15.0 * (414.0 / kScreenWidth);
    let kWidthScale = (414.0 / kScreenWidth);
    let kHeightScale = (736.0 / kScreenHeight);
    
    //setter
    var meModel:ETTMeModel?
    {
        didSet
        {
            nameLabel?.text = meModel?.nameLabelText;
            //nameLabel?.sizeToFit();
            if meModel?.nameLabelText?.count == 2 {
                nameLabel?.frame.size.width = 40.0;
            } else if meModel?.nameLabelText?.count == 4
            {
                nameLabel?.frame.size.width = 70.0;
            } else
            {
                nameLabel?.frame.size.width = 100.0;
            }
            badgeImageView?.frame.origin.x = (nameLabel?.frame.maxX)! + kMargin / 2.0;
            subNameLabel?.text = meModel?.subNameLabelText;
            arrowImageView?.image = UIImage.init(named: (meModel?.arrowImageView)!);
        }
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    func setupSubviews() -> Void 
    {
        //nameLabel
        let nameLabelWidth:CGFloat  = 80.0 * kWidthScale;
        let nameLabelHeight:CGFloat = self.contentView.frame.size.height;
        let nameLabelX:CGFloat = kMargin;
        let nameLabelY:CGFloat = 0.0;
        nameLabel = UILabel.init(frame: CGRect(x: nameLabelX, y: nameLabelY, width: nameLabelWidth, height: nameLabelHeight));
        nameLabel?.text = "我的消息";
        nameLabel?.textAlignment = NSTextAlignment.left;
        nameLabel?.textColor = UIColor.black;
        nameLabel?.font = UIFont.systemFont(ofSize: 15.0)
        nameLabel?.center.y = self.contentView.center.y;
        self.contentView.addSubview(nameLabel!)
        
        //badgeImageView
        badgeImageView = UIImageView.init();
        badgeImageView?.backgroundColor = UIColor.red;
        let badgeImageViewX:CGFloat = (nameLabel?.frame.maxX)! + kMargin;
        let badgeImageViewWidthHeight:CGFloat = 5.0;
        let badgeImageViewY = (self.contentView.frame.size.height - badgeImageViewWidthHeight) / 2.0;
        
        badgeImageView?.frame = CGRect(x: badgeImageViewX, y: badgeImageViewY, width: badgeImageViewWidthHeight, height: badgeImageViewWidthHeight);
        badgeImageView?.layer.cornerRadius = 2.5;
        badgeImageView?.clipsToBounds = true;
        self.contentView.addSubview(badgeImageView!);
        
        //arrow
        let arrowImageViewX = kScreenWidth - 2 * kMargin;
        let arrowImageViewY = (self.contentView.frame.size.height - 17 * kHeightScale) / 2.0;
        let arrowImageViewWidth = 10 * kWidthScale;
        let arrowImageViewHeight = 17 * kHeightScale;
        arrowImageView = UIImageView.init(frame: CGRect(x: arrowImageViewX, y: arrowImageViewY, width: arrowImageViewWidth, height: arrowImageViewHeight));
        self.contentView.addSubview(arrowImageView!);
        
        //subNameLabel
        let subNameLabelWidth = kScreenWidth - 2 * kMargin - (arrowImageView?.frame.size.width)!;
        let subNameLabelHeight:CGFloat = 30.0;
        let subNameLabelX = kScreenWidth - subNameLabelWidth - 3 * kMargin;
        let subNameLabelY = (self.contentView.frame.height - 30.0 ) / 2.0;
        subNameLabel = UILabel.init(frame: CGRect(x: subNameLabelX, y: subNameLabelY, width: subNameLabelWidth, height: subNameLabelHeight));
        subNameLabel?.text = "邀请好友得现金红包";
        subNameLabel?.textColor = UIColor.black;
        subNameLabel?.textAlignment = NSTextAlignment.right;
        subNameLabel?.font = UIFont.systemFont(ofSize: 15.0);
        self.contentView.addSubview(subNameLabel!);
    }
    
    
    required init?(coder aDecoder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
