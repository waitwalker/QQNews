//
//  ETTMeCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Masonry

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
            nameLabel?.sizeToFit();
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
        nameLabel = UILabel.init();
        nameLabel?.text = "我的消息";
        nameLabel?.textAlignment = NSTextAlignment.left;
        nameLabel?.textColor = UIColor.black;
        nameLabel?.font = UIFont.systemFont(ofSize: 15.0);
        self.contentView.addSubview(nameLabel!)
        let _ = nameLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(20);
            make?.top.equalTo()(self.contentView)?.offset()(0);
            make?.bottom.equalTo()(self.contentView)?.offset()(0);
        });
        
        //badgeImageView
        badgeImageView = UIImageView.init();
        badgeImageView?.backgroundColor = UIColor.red;
        badgeImageView?.layer.cornerRadius = 2.5;
        badgeImageView?.clipsToBounds = true;
        self.contentView.addSubview(badgeImageView!);
        let _ = badgeImageView?.mas_makeConstraints({ (make) in
            make?.width.height().equalTo()(5);
            make?.left.equalTo()(self.nameLabel?.mas_right)?.offset()(5);
            make?.centerY.equalTo()(self.nameLabel);
        })
        
        
        //arrow
        arrowImageView = UIImageView.init();
        self.contentView.addSubview(arrowImageView!);
        let _ = arrowImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView.mas_right)?.offset()(-15);
            make?.centerY.equalTo()(self.contentView);
            make?.height.equalTo()(17);
            make?.width.equalTo()(10);
        })
        
        //subNameLabel
        subNameLabel = UILabel.init();
        subNameLabel?.text = "邀请好友得现金红包";
        subNameLabel?.textColor = UIColor.black;
        subNameLabel?.textAlignment = NSTextAlignment.right;
        subNameLabel?.font = UIFont.systemFont(ofSize: 15.0);
        self.contentView.addSubview(subNameLabel!);
        let _ = subNameLabel?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.arrowImageView?.mas_left)?.offset()(-10);
            make?.height.equalTo()(self.contentView);
            make?.width.equalTo()(200);
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
