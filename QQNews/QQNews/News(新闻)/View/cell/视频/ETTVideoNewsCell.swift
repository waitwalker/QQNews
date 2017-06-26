//
//  ETTVideoNewsCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/23.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTVideoNewsCell: ETTTableViewCell {

    var VTitleLabel:UILabel?
    var VBackgroundImageView:UIImageView?
    var VPlayContentView:UIView?
    var VPlayImageView:UIImageView?
    var VRemainTimeLabel:UILabel?
    var VSourceContentView:UIView?
    var VSourceImageView:UIImageView?
    var VSourceNikeNameLabel:UILabel?
    var VCategoryLabel:UILabel?
    var VCommentImageView:UIImageView?
    var VCommentLabel:UILabel?
    var VDotImageView:UIImageView?
    
    
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
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews();
    }
    
    func setupSubviews() -> Void 
    {
        VTitleLabel = UILabel();
        VTitleLabel?.textColor = kRandomColor();
        VTitleLabel?.backgroundColor = kRandomColor();
        VTitleLabel?.textAlignment = NSTextAlignment.left;
        VTitleLabel?.font = UIFont.systemFont(ofSize: kTitleFont);
        VTitleLabel?.text = "视频连接";
        self.contentView.addSubview(VTitleLabel!);
        let _ = VTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.top.equalTo()(self.contentView)?.offset()(10);
            make?.height.equalTo()(50);
        })
        
        VSourceContentView = UIView();
        VSourceContentView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(VSourceContentView!);
        let _ = VSourceContentView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.height.equalTo()(30);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
            make?.width.equalTo()(100);
        })
        
        VSourceImageView = UIImageView();
        VSourceImageView?.backgroundColor = kRandomColor();
        VSourceImageView?.layer.cornerRadius = 13.0;
        VSourceImageView?.clipsToBounds = true;
        VSourceImageView?.isUserInteractionEnabled = true;
        VSourceContentView?.addSubview(VSourceImageView!);
        let _ = VSourceImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.VSourceContentView)?.offset()(5);
            make?.height.width().equalTo()(26);
            make?.top.equalTo()(self.VSourceContentView)?.offset()(2);
        })
        
        VSourceNikeNameLabel = UILabel();
        VSourceNikeNameLabel?.textAlignment = NSTextAlignment.left;
        VSourceNikeNameLabel?.textColor = kRandomColor();
        VSourceNikeNameLabel?.backgroundColor = kRandomColor();
        VSourceNikeNameLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        VSourceContentView?.addSubview(VSourceNikeNameLabel!);
        let _ = VSourceNikeNameLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.VSourceImageView?.mas_right)?.offset()(5);
            make?.right.equalTo()(self.VSourceContentView?.mas_right)?.offset()(-5);
            make?.top.equalTo()(self.VSourceContentView)?.offset()(0);
            make?.height.equalTo()(self.VSourceContentView);
        })
        
        VCategoryLabel = UILabel();
        VCategoryLabel?.textAlignment = NSTextAlignment.left;
        VCategoryLabel?.textColor = kRandomColor();
        VCategoryLabel?.backgroundColor = kRandomColor();
        VCategoryLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        self.contentView.addSubview(VCategoryLabel!);
        let _ = VCategoryLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.VSourceContentView?.mas_right)?.offset()(10);
            make?.height.bottom().equalTo()(self.VSourceContentView);
            make?.width.equalTo()(60);
        })
        
        VDotImageView = UIImageView();
        VDotImageView?.isUserInteractionEnabled = true;
        VDotImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(VDotImageView!);
        let _ = VDotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView.mas_right)?.offset()(-15);
            make?.width.equalTo()(40);
            make?.height.bottom().equalTo()(self.VSourceContentView);
        })
        
        VCommentLabel = UILabel();
        VCommentLabel?.textColor = kRandomColor();
        VCommentLabel?.textAlignment = NSTextAlignment.left;
        VCommentLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        VCommentLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(VCommentLabel!);
        let _ = VCommentLabel?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.VDotImageView?.mas_left)?.offset()(-0);
            make?.height.bottom().width().equalTo()(self.VDotImageView);
        })
        
        VCommentImageView = UIImageView();
        VCommentImageView?.backgroundColor = kRandomColor();
        VCommentImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(VCommentImageView!);
        let _ = VCommentImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.VCommentLabel?.mas_left)?.offset()(-10);
            make?.height.width().equalTo()(30);
            make?.bottom.equalTo()(self.VCommentLabel);
        })
        
        VBackgroundImageView = UIImageView();
        VBackgroundImageView?.isUserInteractionEnabled = true;
        VBackgroundImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(VBackgroundImageView!);
        let _ = VBackgroundImageView?.mas_makeConstraints({ (make) in
            make?.left.right().equalTo()(self.VTitleLabel);
            make?.top.equalTo()(self.VTitleLabel?.mas_bottom)?.offset()(10);
            make?.bottom.equalTo()(self.VSourceContentView?.mas_top)?.offset()(-10);
        })
        
        VPlayContentView = UIView();
        VPlayContentView?.backgroundColor = kRandomColor().withAlphaComponent(0.3);
        VPlayContentView?.layer.cornerRadius = 30.0;
        VPlayContentView?.clipsToBounds = true;
        VBackgroundImageView?.addSubview(VPlayContentView!);
        let _ = VPlayContentView?.mas_makeConstraints({ (make) in
            make?.width.height().equalTo()(60);
            make?.center.equalTo()(self.VBackgroundImageView);
        })
        
        VPlayImageView = UIImageView();
        VPlayImageView?.isUserInteractionEnabled = true;
        VPlayImageView?.backgroundColor = kRandomColor();
        VBackgroundImageView?.addSubview(VPlayImageView!);
        let _ = VPlayImageView?.mas_makeConstraints({ (make) in
            make?.height.width().equalTo()(30);
            make?.center.equalTo()(self.VPlayContentView);
        })
        
        VRemainTimeLabel = UILabel();
        VRemainTimeLabel?.textColor = kRandomColor();
        VRemainTimeLabel?.backgroundColor = kRandomColor();
        VRemainTimeLabel?.textAlignment = NSTextAlignment.left;
        VRemainTimeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        VBackgroundImageView?.addSubview(VRemainTimeLabel!);
        let _ = VRemainTimeLabel?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.VBackgroundImageView?.mas_right)?.offset()(-15);
            make?.bottom.equalTo()(self.VBackgroundImageView?.mas_bottom)?.offset()(-10);
            make?.width.equalTo()(40);
            make?.height.equalTo()(20);
        })
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
