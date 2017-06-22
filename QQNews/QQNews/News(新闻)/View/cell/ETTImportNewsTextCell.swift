//
//  ETTNewsTextCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/22.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Masonry

class ETTImportNewsTextCell: ETTTableViewCell {
    
    var titleLabel:UILabel?
    var topicLabel:UILabel?
    var commentNumLabel:UILabel?
    var timeLabel:UILabel?
    var dotImageView:UIImageView?
    var pictureImageView:UIImageView?
    
    let kTitleFont:CGFloat = 20.0;
    let kTitleColor:UIColor = UIColor.black;
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void 
    {
        titleLabel = UILabel();
        titleLabel?.font = UIFont.systemFont(ofSize: kTitleFont);
        titleLabel?.textColor = kTitleColor;
        titleLabel?.textAlignment = NSTextAlignment.left;
        titleLabel?.numberOfLines = 2;
        self.contentView.addSubview(titleLabel!);
        let _ = titleLabel?.mas_makeConstraints({ (make) in
            
            make?.left.equalTo()(self.contentView)?.offset()(20); 
            make?.bottom.equalTo()(self.contentView)?.offset()(10);
            make?.right.equalTo()(self.contentView)?.offset()(-120);
            make?.height.equalTo()(60);
            
        });
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
