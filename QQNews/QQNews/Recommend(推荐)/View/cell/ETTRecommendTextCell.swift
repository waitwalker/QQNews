//
//  ETTRecommendTextCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/3.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import SDWebImage

class ETTRecommendTextCell: ETTTableViewCell {
    
    var titleLabel:UILabel?
    var topicLabel:UILabel?
    var commentNumLabel:UILabel?
    var timeLabel:UILabel?
    var dotImageView:UIImageView?
    var pictureImageView:UIImageView?
    
    let kTitleFont:CGFloat = 20.0;
    let kTitleColor:UIColor = UIColor.black;
    let kSubTitleFont:CGFloat = 8.0;
    let kSubTitleColor:UIColor = UIColor.black;
    
    var recommendModel:ETTRecommendModel?
    {
        didSet
        {
            titleLabel?.text = recommendModel?.title;
            
            pictureImageView?.sd_setImage(with: URL.init(string: (recommendModel?.thumbnailsString)!), placeholderImage: UIImage.init(named: "qq_placeholder"));
        }
        
    }
    
    
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
        titleLabel?.backgroundColor = UIColor.orange;
        self.contentView.addSubview(titleLabel!);
        let _ = titleLabel?.mas_makeConstraints({ (make) in
            
            make?.left.equalTo()(self.contentView)?.offset()(15); 
            make?.top.equalTo()(self.contentView)?.offset()(10);
            make?.right.equalTo()(self.contentView)?.offset()(-150);
            make?.height.equalTo()(60);
        });
        
        pictureImageView = UIImageView();
        pictureImageView?.backgroundColor = kRandomColor();
        pictureImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(pictureImageView!);
        
        let _ = pictureImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.titleLabel?.mas_right)?.offset()(15);
            make?.top.equalTo()(self.contentView)?.offset()(10);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
        })
        
        topicLabel = UILabel();
        topicLabel?.textColor = kETTColor(r: 13, g: 126, b: 213);
        topicLabel?.textAlignment = NSTextAlignment.left;
        topicLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        topicLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(topicLabel!);
        
        let _ = topicLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.titleLabel);
            make?.bottom.equalTo()(self.contentView.mas_bottom)?.offset()(-10);
            make?.height.equalTo()(20);
            make?.width.equalTo()(40);
        })
        
        commentNumLabel = UILabel();
        commentNumLabel?.textColor = kSubTitleColor;
        commentNumLabel?.textAlignment = NSTextAlignment.left;
        commentNumLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        commentNumLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(commentNumLabel!);
        
        let _ = commentNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.topicLabel?.mas_right)?.offset()(10);
            make?.height.bottom().equalTo()(self.topicLabel);
            make?.width.equalTo()(self.topicLabel);
        })
        
        timeLabel = UILabel();
        timeLabel?.textColor = kSubTitleColor;
        timeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        timeLabel?.textAlignment = NSTextAlignment.left;
        timeLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(timeLabel!);
        
        let _ = timeLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.commentNumLabel?.mas_right)?.offset()(10);
            make?.bottom.width().height().equalTo()(self.commentNumLabel);
        })
        
        dotImageView = UIImageView();
        dotImageView?.backgroundColor = kRandomColor();
        dotImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(dotImageView!);
        
        let _ = dotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.titleLabel?.mas_right);
            make?.width.height().bottom().equalTo()(self.timeLabel);
        })
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

