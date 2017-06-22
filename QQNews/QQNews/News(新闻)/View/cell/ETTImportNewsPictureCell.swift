//
//  ETTImportNewsPictureCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/22.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTImportNewsPictureCell: ETTTableViewCell {
    
    var titleLabel:UILabel?
    var pictureImageView:UIImageView?
    var commentNumLabel:UILabel?
    var timeLabel:UILabel?
    var pictureNumLabel:UILabel?
    var dotImageView:UIImageView?
    
    let kTitleFont:CGFloat = 20.0;
    let kTitleColor:UIColor = UIColor.black;
    let kSubTitleFont:CGFloat = 8.0;
    let kSubTitleColor:UIColor = UIColor.black;
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void 
    {
        titleLabel = UILabel();
        titleLabel?.textColor = UIColor.black;
        titleLabel?.textAlignment = NSTextAlignment.left;
        titleLabel?.font = UIFont.systemFont(ofSize: 18.0);
        titleLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(titleLabel!);
        
        let _ = titleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.height.equalTo()(30);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.top.equalTo()(self.contentView)?.offset()(10);
        })
        
        commentNumLabel = UILabel();
        commentNumLabel?.textAlignment = NSTextAlignment.left;
        commentNumLabel?.textColor = kSubTitleColor;
        commentNumLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        commentNumLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(commentNumLabel!);
        
        let _ = commentNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.titleLabel);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
            make?.width.equalTo()(40);
            make?.height.equalTo()(20);
        })
        
        timeLabel = UILabel();
        timeLabel?.textColor = kSubTitleColor;
        timeLabel?.textAlignment = NSTextAlignment.left;
        timeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        timeLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(timeLabel!);
        let _ = timeLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.commentNumLabel?.mas_right)?.offset()(10);
            make?.width.height().bottom().equalTo()(self.commentNumLabel);
        })
        
        dotImageView = UIImageView();
        dotImageView?.isUserInteractionEnabled = true;
        dotImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(dotImageView!);
        let _ = dotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView.mas_right)?.offset()(-15);
            make?.bottom.width().height().equalTo()(self.commentNumLabel);
        })
        
//        pictureImageView = UIImageView();
//        pictureImageView?.isUserInteractionEnabled = true;
//        pictureImageView?.backgroundColor = kRandomColor();
//        self.contentView.addSubview(pictureImageView!);
//        let _ = mas_makeConstraints { (make) in
//            make?.left.equalTo()(self.contentView)?.offset()(15);
//            make?.right.equalTo()(self.contentView)?.offset()(-15);
//            make?.top.equalTo()(self.titleLabel)?.offset()(10);
//            make?.bottom.equalTo()(self.dotImageView)?.offset()(-10);
//        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
