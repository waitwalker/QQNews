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
    
    var nameLabel:UILabel?
    var badgeImageView:UIImageView?
    var subNameLabel:UILabel?
    var narrowImageView :UIImageView?
    
    let kMargin     = 15.0 * (414.0 / kScreenWidth);
    let kWidthScale = (414.0 / kScreenWidth);
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    func setupSubviews() -> Void 
    {
        //nameLabel
        let nameLabelWidth:CGFloat  = 120.0 * kWidthScale;
        let nameLabelHeight:CGFloat = 30.0;
        let nameLabelX:CGFloat = kMargin;
        let nameLabelY:CGFloat = (self.contentView.frame.size.height - nameLabelHeight) / 2.0;
        nameLabel = UILabel.init(frame: CGRect(x: nameLabelX, y: nameLabelY, width: nameLabelWidth, height: nameLabelHeight));
        nameLabel?.text = "我的消息";
        nameLabel?.textAlignment = NSTextAlignment.left;
        nameLabel?.textColor = UIColor.black;
        nameLabel?.font = UIFont.systemFont(ofSize: 15.0)
        self.contentView.addSubview(nameLabel!)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
