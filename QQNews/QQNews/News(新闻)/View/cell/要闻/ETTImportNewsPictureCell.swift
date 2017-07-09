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
    var picturesImageView:UIImageView?
    var commentNumLabel:UILabel?
    var timeLabel:UILabel?
    var pictureNumLabel:UILabel?
    var dotImageView:UIImageView?
    
    let kTitleFont:CGFloat = 20.0;
    let kTitleColor:UIColor = UIColor.black;
    let kSubTitleFont:CGFloat = 8.0;
    let kSubTitleColor:UIColor = UIColor.black;
    
    var importNewsModel:ETTImportNewsModel?
    {
        didSet
        {
            timeLabel?.text = importNewsModel?.title;
            commentNumLabel?.sizeToFit()
            var imageString = importNewsModel?.thumbnailsBigString
            if imageString == nil
            {
                imageString = (importNewsModel?.thumbnailsString)!
            }
            
            picturesImageView?.sd_setImage(with: URL.init(string: imageString!), placeholderImage: UIImage.init(named: "qq_placeholder"))
            pictureNumLabel?.text = String(format: "%d图", (importNewsModel?.imagecount)!)
        }
    }
    
    
    
    
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
        commentNumLabel?.text = String(format: "%d评", kRandowNum())
        self.contentView.addSubview(commentNumLabel!);
        
        let _ = commentNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.titleLabel);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
            make?.height.equalTo()(20);
        })
        
        timeLabel = UILabel();
        timeLabel?.textColor = kSubTitleColor;
        timeLabel?.textAlignment = NSTextAlignment.left;
        timeLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        timeLabel?.isHidden = true
        self.contentView.addSubview(timeLabel!);
        let _ = timeLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.commentNumLabel?.mas_right)?.offset()(10);
            make?.width.height().bottom().equalTo()(self.commentNumLabel);
        })
        
        dotImageView = UIImageView();
        dotImageView?.isUserInteractionEnabled = true;
        dotImageView?.image = UIImage(named: "timeline_icon_dot")
        self.contentView.addSubview(dotImageView!)
        let _ = dotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView.mas_right)?.offset()(-15);
            make?.width.equalTo()(25);
            make?.height.equalTo()(15);
            make?.bottom.equalTo()(self.commentNumLabel);
        })
        
        picturesImageView = UIImageView();
        picturesImageView?.isUserInteractionEnabled = true;
        picturesImageView?.backgroundColor = kRandomColor();
        self.contentView.addSubview(picturesImageView!);
        let _ = picturesImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.top.equalTo()(self.titleLabel?.mas_bottom)?.offset()(10);
            make?.bottom.equalTo()(self.commentNumLabel?.mas_top)?.offset()(-10);
        })
        
        pictureNumLabel = UILabel();
        pictureNumLabel?.textColor = UIColor.white;
        pictureNumLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        pictureNumLabel?.textAlignment = NSTextAlignment.left;
        picturesImageView?.addSubview(pictureNumLabel!);
        let _ = pictureNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.picturesImageView)?.offset()(15);
            make?.bottom.equalTo()(self.picturesImageView)?.offset()(-10);
            make?.width.height().equalTo()(self.commentNumLabel);
        })
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
