//
//  ETTRecommendVideoCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/7/3.
//  Copyright © 2017年 waitWalker. All rights reserved.
//


import UIKit

class ETTRecommendVideoCell: ETTTableViewCell {
    
    var vTitleLabel:UILabel?
    var vBackgroundImageView:UIImageView?
    var vPlayContentView:UIView?
    var vPlayImageView:UIImageView?
    var vVideoNumContentView:UIView?
    var vVideoNumImageView:UIImageView?
    var vVideoNumLabel:UILabel?
    var vRemainTimeLabel:UILabel?
    var vCommentLabel:UILabel?
    var vTimeLabel:UILabel?
    var vDotImageView:UIImageView?
    
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
        vTitleLabel = UILabel();
        vTitleLabel?.textColor = kSubTitleColor;
        vTitleLabel?.textAlignment = NSTextAlignment.left;
        vTitleLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        vTitleLabel?.backgroundColor = kRandomColor();
        vTitleLabel?.numberOfLines = 2;
        self.contentView.addSubview(vTitleLabel!);
        let _ = vTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.top.equalTo()(self.contentView)?.offset()(10);
            make?.height.equalTo()(50);
        });
        
        vCommentLabel = UILabel();
        vCommentLabel?.textAlignment = NSTextAlignment.left;
        vCommentLabel?.textColor = kSubTitleColor;
        vCommentLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        vCommentLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(vCommentLabel!);
        let _ = vCommentLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.vTitleLabel);
            make?.width.equalTo()(40);
            make?.height.equalTo()(20);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
        })
        
        vTimeLabel = UILabel();
        vTimeLabel?.textColor = kSubTitleColor;
        vTimeLabel?.textAlignment = NSTextAlignment.left;
        vTimeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        vTimeLabel?.backgroundColor = kRandomColor();
        self.contentView.addSubview(vTimeLabel!);
        let _ = vTimeLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.vCommentLabel?.mas_right)?.offset()(10);
            make?.width.height().bottom().equalTo()(self.vCommentLabel);
        })
        
        vDotImageView = UIImageView();
        vDotImageView?.isUserInteractionEnabled = true;
        vDotImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(vDotImageView!);
        let _ = vDotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.width.height().bottom().equalTo()(self.vCommentLabel);
        })
        
        vBackgroundImageView = UIImageView();
        vBackgroundImageView?.isUserInteractionEnabled = true;
        vBackgroundImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(vBackgroundImageView!);
        let _ = vBackgroundImageView?.mas_makeConstraints({ (make) in
            make?.left.right().equalTo()(self.vTitleLabel);
            make?.top.equalTo()(self.vTitleLabel?.mas_bottom)?.offset()(10);
            make?.bottom.equalTo()(self.vCommentLabel?.mas_top)?.offset()(-10);
        })
        
        vPlayContentView = UIView();
        vPlayContentView?.backgroundColor = kRandomColor().withAlphaComponent(0.3);
        vPlayContentView?.layer.cornerRadius = 30;
        vPlayContentView?.clipsToBounds = true;
        vBackgroundImageView?.addSubview(vPlayContentView!);
        let _ = vPlayContentView?.mas_makeConstraints({ (make) in
            make?.width.height().equalTo()(60);
            make?.center.equalTo()(self.vBackgroundImageView);
        })
        
        vPlayImageView = UIImageView();
        vPlayImageView?.isUserInteractionEnabled = true;
        vPlayImageView?.backgroundColor = kRandomColor();
        vPlayContentView?.addSubview(vPlayImageView!);
        let _ = vPlayImageView?.mas_makeConstraints({ (make) in
            make?.height.width().equalTo()(30);
            make?.center.equalTo()(self.vPlayContentView);
        })
        
        vVideoNumContentView = UIView();
        vVideoNumContentView?.backgroundColor = kRandomColor().withAlphaComponent(0.3);
        vBackgroundImageView?.addSubview(vVideoNumContentView!);
        let _ = vVideoNumContentView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.vBackgroundImageView)?.offset()(10);
            make?.bottom.equalTo()(self.vBackgroundImageView)?.offset()(-10);
            make?.width.equalTo()(80);
            make?.height.equalTo()(self.vCommentLabel);
        })
        
        vVideoNumImageView = UIImageView();
        vVideoNumImageView?.backgroundColor = kRandomColor();
        vVideoNumImageView?.isUserInteractionEnabled = true;
        vVideoNumContentView?.addSubview(vVideoNumImageView!);
        let _ = vVideoNumImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.vVideoNumContentView)?.offset()(5)
            make?.top.equalTo()(self.vVideoNumContentView)?.offset()(2.5);
            make?.bottom.equalTo()(self.vVideoNumContentView)?.offset()(-2.5);
            make?.width.equalTo()(15);
        })
        
        vVideoNumLabel = UILabel();
        vVideoNumLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        vVideoNumLabel?.backgroundColor = kRandomColor();
        vVideoNumLabel?.textAlignment = NSTextAlignment.left;
        vVideoNumContentView?.addSubview(vVideoNumLabel!);
        let _ = vVideoNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.vVideoNumImageView?.mas_right)?.offset()(5);
            make?.top.height().equalTo()(self.vVideoNumImageView);
            make?.right.equalTo()(self.vVideoNumContentView?.mas_right)?.offset()(-5);
        })
        
        vRemainTimeLabel = UILabel();
        vRemainTimeLabel?.textAlignment = NSTextAlignment.left;
        vRemainTimeLabel?.backgroundColor = kRandomColor();
        vRemainTimeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        vRemainTimeLabel?.textColor = UIColor.white;
        vBackgroundImageView?.addSubview(vRemainTimeLabel!);
        let _ = vRemainTimeLabel?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.vBackgroundImageView?.mas_right)?.offset()(-15);
            make?.height.width().equalTo()(self.vCommentLabel);
            make?.bottom.equalTo()(self.vVideoNumContentView);
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
