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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    func setupSubviews() -> Void 
    {
        nameLabel = UILabel.init(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        
    }
    
    required init?(coder aDecoder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
