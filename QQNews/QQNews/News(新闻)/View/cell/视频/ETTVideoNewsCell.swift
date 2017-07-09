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
    var VPlayContentView:UIImageView?
    var VPlayImageView:UIImageView?
    var VRemainTimeLabel:UILabel?
    var VSourceContentView:UIView?
    var VSourceImageView:UIImageView?
    var VSourceNikeNameLabel:UILabel?
    var VCategoryLabel:UILabel?
    var VCommentImageView:UIImageView?
    var VCommentLabel:UILabel?
    var VDotImageView:UIImageView?
    
    /*
     [0]    Object
     id    String    20170707V04E2Z00
     thumbnails_qqnews    Array
     [0]    String    http://puui.qpic.cn/qqvideo_ori/0/l0522qhy0kl_496_280/0
     thumbnails    Array
     [0]    String    http://puui.qpic.cn/qqvideo_ori/0/l0522qhy0kl_496_280/0
     articletype    String    4
     flag    String    16
     timestamp    Integer    1499409605
     time    String    2017-07-07 14:40:05
     commentid    String    2018908739
     url    String    https://view.inews.qq.com/a/20170707V04E2Z00
     title    String    大爷硬闯红灯被交警拦住，太惊险了！
     tag    Array
     abstract    String    大爷硬闯红灯被交警拦住，太惊险了！
     author    Array
     chlid    String    5551068
     origUrl    String
     show_expr    Integer    1
     hasVideo    Integer    1
     picShowType    Integer    0
     chlname    String    今日车神
     source    String    今日车神
     chlmrk    String    2017年最火爆汽车原创节目《今日车神》，老司机都在看！
     chlsicon    String    http://inews.gtimg.com/newsapp_ls/0/1421672980_200200/0
     chlicon    String    http://inews.gtimg.com/newsapp_ls/0/1421672980_200200/0
     uin    String    ec8bb1459b9d84100312bf035bb43cd4d0
     card    Object
     chlname    String    今日车神
     chlid    String    5551068
     desc    String    2017年最火爆汽车原创节目《今日车神》，老司机都在看！
     icon    String    http://inews.gtimg.com/newsapp_ls/0/1421672980_200200/0
     uin    String    ec8bb1459b9d84100312bf035bb43cd4d0
     intro    String
     msgEntry    Integer    1
     PlacementId    String
     SubAdOn    Integer    0
     imagecount    Integer    0
     media_id    String    5551068
     videoTotalTime    String    02:37
     disableDeclare    Integer    0
     forbidCommentUpDown    Integer    0
     video_channel    Object
     egid    String    20170707V04E2Z00
     eid    String    1
     openSupport    Integer    1
     video    Object
     videosourcetype    Integer    1
     playmode    Integer    1
     duration    String    02:37
     vid    String    l0522qhy0kl
     desc    String
     img    String    http://puui.qpic.cn/qqvideo_ori/0/l0522qhy0kl_496_280/0
     playurl    String    http://inews.qq.com/webVideo?vid=l0522qhy0kl&img=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_ls%2F0%2F1750466102_640480%2F0&appver=
     width    Integer    640
     height    Integer    400
     screenType    Integer    0
     playcount    Integer    700867
     aspect    Number    1.767
     supportVR    Integer    0
     formatlist    Array
     [0]    Object
     fs    Integer    9860603
     name    String    hd
     [1]    Object
     [2]    Object
     longtitle    String    大爷硬闯红灯被交警拦住，太惊险了！
     show_source    Integer    0
     forbidExpr    Integer    1
     disableDelete    Integer    0
     qishu    String
     isSensitive    Integer    0
     forbidRedPacket    Integer    1
     toneScore    Null    null
     qualityScore    Null    null
     bigImage    Array
     [0]    String    http://inews.gtimg.com/newsapp_ls/0/1750466102_496280/0
     realChlName    String
     thumbnails_qqnews_photo    Array
     [0]    String    http://puui.qpic.cn/qqvideo_ori/0/l0522qhy0kl_496_280/0
     seq_no    String    243199566775$$$----0
     alg_version    Integer    1
     reasonInfo    String
     article_pos    Integer    1
     
     */
    
    var videoNewsModel:ETTVideoNewsModel?
    {
        didSet
        {
            VTitleLabel?.text = videoNewsModel?.title;
            VBackgroundImageView?.sd_setImage(with: URL.init(string: (videoNewsModel?.bigImageString)!), placeholderImage: UIImage(named:kPlace_holder))
            VRemainTimeLabel?.text = videoNewsModel?.videoTotalTime
            VSourceImageView?.sd_setImage(with: URL.init(string: (videoNewsModel?.bigImageString!)!), placeholderImage: UIImage(named: kPlace_holder))
            VCommentLabel?.text = String(format: "%ld",(videoNewsModel?.pushCommentCount)!);
            VSourceNikeNameLabel?.text = videoNewsModel?.source;
            VSourceNikeNameLabel?.sizeToFit()
            VCategoryLabel?.text = videoNewsModel?.title?.substring(to: (videoNewsModel?.title?.index((videoNewsModel?.title?.startIndex)!, offsetBy: 4))!)
            VCommentLabel?.text = String(format: "%d", kRandowNum())
            VCommentImageView?.image = kImage(named: "Immersedetailspage_toolbar_icon_comment_blue")
            if videoNewsModel?.video_channel?.video?.duration == nil
            {
                VRemainTimeLabel?.text = "05:36";
            } else
            {
                VRemainTimeLabel?.text = videoNewsModel?.video_channel?.video?.duration;
            }
        }
        
    }
    
    
    
    let kTitleFont:CGFloat = 18.0;
    let kTitleColor:UIColor = UIColor.black;
    let kSubTitleFont:CGFloat = 12.0;
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
        VTitleLabel?.textColor = UIColor.black
        VTitleLabel?.textAlignment = NSTextAlignment.left;
        VTitleLabel?.font = UIFont.systemFont(ofSize: kTitleFont);
        VTitleLabel?.text = "视频连接";
        VTitleLabel?.numberOfLines = 2;
        self.contentView.addSubview(VTitleLabel!);
        let _ = VTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.right.equalTo()(self.contentView)?.offset()(-15);
            make?.top.equalTo()(self.contentView)?.offset()(10);
            make?.height.equalTo()(50);
        })
        
        VSourceContentView = UIView();
        VSourceContentView?.layer.cornerRadius = 5.0
        VSourceContentView?.layer.borderColor = UIColor.black.cgColor
        VSourceContentView?.layer.borderWidth = 0.5
        VSourceContentView?.clipsToBounds = true
        self.contentView.addSubview(VSourceContentView!);
        let _ = VSourceContentView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.contentView)?.offset()(15);
            make?.height.equalTo()(30);
            make?.bottom.equalTo()(self.contentView)?.offset()(-10);
            make?.width.equalTo()(100);
        })
        
        VSourceImageView = UIImageView();
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
        VSourceNikeNameLabel?.textColor = kSubTitleColor;
        VSourceNikeNameLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        VSourceContentView?.addSubview(VSourceNikeNameLabel!);
        let _ = VSourceNikeNameLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.VSourceImageView?.mas_right)?.offset()(5);
            make?.top.equalTo()(self.VSourceContentView)?.offset()(0);
            make?.height.equalTo()(self.VSourceContentView);
        })
        
        VCategoryLabel = UILabel();
        VCategoryLabel?.textAlignment = NSTextAlignment.center;
        VCategoryLabel?.textColor = kSubTitleColor;
        VCategoryLabel?.layer.cornerRadius = 5.0
        VCategoryLabel?.layer.borderColor = UIColor.black.cgColor
        VCategoryLabel?.layer.borderWidth = 0.5
        VCategoryLabel?.clipsToBounds = true
        VCategoryLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        self.contentView.addSubview(VCategoryLabel!);
        let _ = VCategoryLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.VSourceContentView?.mas_right)?.offset()(10);
            make?.height.bottom().equalTo()(self.VSourceContentView);
            make?.width.equalTo()(70)
        })
        
        VDotImageView = UIImageView();
        VDotImageView?.isUserInteractionEnabled = true;
        VDotImageView?.image = UIImage(named: "timeline_icon_dot")
        self.contentView.addSubview(VDotImageView!);
        let _ = VDotImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.contentView.mas_right)?.offset()(-15);
            make?.width.equalTo()(40);
            make?.height.bottom().equalTo()(self.VSourceContentView);
        })
        
        VCommentLabel = UILabel();
        VCommentLabel?.textColor = kSubTitleColor;
        VCommentLabel?.textAlignment = NSTextAlignment.left;
        VCommentLabel?.font = UIFont.systemFont(ofSize: kSubTitleFont);
        self.contentView.addSubview(VCommentLabel!);
        let _ = VCommentLabel?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.VDotImageView?.mas_left)?.offset()(-0);
            make?.height.bottom().width().equalTo()(self.VDotImageView);
        })
        
        VCommentImageView = UIImageView();
        VCommentImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(VCommentImageView!);
        let _ = VCommentImageView?.mas_makeConstraints({ (make) in
            make?.right.equalTo()(self.VCommentLabel?.mas_left)?.offset()(-10);
            make?.height.width().equalTo()(30);
            make?.bottom.equalTo()(self.VCommentLabel);
        })
        
        VBackgroundImageView = UIImageView();
        VBackgroundImageView?.isUserInteractionEnabled = true;
        self.contentView.addSubview(VBackgroundImageView!);
        let _ = VBackgroundImageView?.mas_makeConstraints({ (make) in
            make?.left.right().equalTo()(self.VTitleLabel);
            make?.top.equalTo()(self.VTitleLabel?.mas_bottom)?.offset()(10);
            make?.bottom.equalTo()(self.VSourceContentView?.mas_top)?.offset()(-10);
        })
        
        VPlayContentView = UIImageView();
        VPlayContentView?.image = UIImage(named: "timeline_video_icon")
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
        VPlayImageView?.isHidden = true
        VBackgroundImageView?.addSubview(VPlayImageView!);
        let _ = VPlayImageView?.mas_makeConstraints({ (make) in
            make?.height.width().equalTo()(30);
            make?.center.equalTo()(self.VPlayContentView);
        })
        
        VRemainTimeLabel = UILabel();
        VRemainTimeLabel?.textColor = kSubTitleColor;
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
