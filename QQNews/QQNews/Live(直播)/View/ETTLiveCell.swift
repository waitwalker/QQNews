//
//  ETTLiveCell.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Masonry

class ETTLiveCell: ETTTableViewCell {
    
    var LBachgroundImageView:UIImageView?
    var LTitleLabel:UILabel?
    var LLiveImageView:UIImageView?
    var LAudienceImageView:UIImageView?
    var LAudienceNumLabel:UILabel?
    var LHotImageView:UIImageView?
    var LHotNumLabel:UILabel?
    var LSourceLabel:UILabel?
    var LBottomContentView:UIView?
    
    var choiceLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = choiceLiveModel?.title
            LSourceLabel?.text = choiceLiveModel?.source
            if choiceLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            LAudienceNumLabel?.text = String(format: "%d", (choiceLiveModel?.live_info?.online_total)!)
            LAudienceNumLabel?.sizeToFit()
            LHotNumLabel?.text = String(format: "%d", (choiceLiveModel?.live_info?.up_num)!)
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.layoutSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 初始化子控件
    func setupSubviews() -> Void
    {
        //背景图片
        self.contentView.backgroundColor = UIColor.lightGray
        LBachgroundImageView = UIImageView()
        LBachgroundImageView?.isUserInteractionEnabled = true
        LBachgroundImageView?.backgroundColor = kRandomColor()
        self.contentView.addSubview(LBachgroundImageView!)
        
        //直
        LLiveImageView = UIImageView()
        LLiveImageView?.isUserInteractionEnabled = true
        LLiveImageView?.image = kImage(named: "")
        LBachgroundImageView?.addSubview(LLiveImageView!)
        
        //头像
        LAudienceImageView = UIImageView()
        LAudienceImageView?.isUserInteractionEnabled = true
        LAudienceImageView?.image = kImage(named: "")
        LBachgroundImageView?.addSubview(LAudienceImageView!)
        
        //人数
        LAudienceNumLabel = UILabel()
        LAudienceNumLabel?.textColor = UIColor.white
        LAudienceNumLabel?.textAlignment = NSTextAlignment.left
        LAudienceNumLabel?.font = UIFont.systemFont(ofSize: 12.0)
        LBachgroundImageView?.addSubview(LAudienceNumLabel!)
        
        //火
        LHotImageView = UIImageView()
        LHotImageView?.isUserInteractionEnabled = true
        LHotImageView?.image = kImage(named: "")
        LBachgroundImageView?.addSubview(LHotImageView!)
        
        //火人数
        LHotNumLabel = UILabel()
        LHotNumLabel?.textColor = UIColor.white
        LHotNumLabel?.textAlignment = NSTextAlignment.left
        LHotNumLabel?.font = UIFont.systemFont(ofSize: 12.0)
        LBachgroundImageView?.addSubview(LHotNumLabel!)
        
        //标题
        LTitleLabel = UILabel()
        LTitleLabel?.textColor = UIColor.white
        LTitleLabel?.textAlignment = NSTextAlignment.left
        LTitleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        LBachgroundImageView?.addSubview(LTitleLabel!)
        
        //底部容器
        LBottomContentView = UIView()
        LBottomContentView?.backgroundColor = UIColor.white
        self.contentView.addSubview(LBottomContentView!)
        
        //来源
        LSourceLabel = UILabel()
        LSourceLabel?.textAlignment = NSTextAlignment.left
        LSourceLabel?.font = UIFont.systemFont(ofSize: 15.0)
        LSourceLabel?.textColor = UIColor.black
        LBottomContentView?.addSubview(LSourceLabel!)
        
    }
    
    func layoutSubview() -> Void
    {
        let _ = LBachgroundImageView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.left.right().equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-50)
        })
        
        //直播图标
        let _ = LLiveImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LBachgroundImageView)?.offset()(20)
            make?.bottom.equalTo()(self.LBachgroundImageView)?.offset()(-20)
            make?.height.equalTo()(20)
            make?.width.equalTo()(60)
        })
        
        if !(LLiveImageView?.isHidden)!
        {
            let _ = LAudienceImageView?.mas_makeConstraints({ (make) in
                make?.left.equalTo()(self.LLiveImageView?.mas_right)?.offset()(20)
                make?.height.equalTo()(15)
                make?.width.equalTo()(10)
                make?.centerY.equalTo()(self.LBachgroundImageView)
            })
            
        } else
        {
            let _ = LAudienceImageView?.mas_makeConstraints({ (make) in
                make?.left.equalTo()(self.LBachgroundImageView)?.offset()(20)
                make?.bottom.equalTo()(self.LBachgroundImageView)?.offset()(-25)
                make?.height.equalTo()(15)
                make?.width.equalTo()(10)
            })
        }
        
        let _ = LAudienceNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LAudienceImageView?.mas_right)?.offset()(10)
            make?.height.equalTo()(self.LAudienceImageView)
            make?.centerY.equalTo()(self.LAudienceImageView)
        })
        
        let _ = LHotImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LAudienceNumLabel?.mas_right)?.offset()(20)
            make?.height.centerY().with().equalTo()(self.LAudienceImageView)
        })
        
        let _ = LHotNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LHotImageView?.mas_right)?.offset()(10)
            make?.height.centerY().equalTo()(self.LAudienceNumLabel)
        })
        
        let _ = LTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LBachgroundImageView)?.offset()(20)
            make?.right.equalTo()(self.LBachgroundImageView)?.offset()(-20)
            make?.height.equalTo()(30)
            make?.bottom.equalTo()(self.LAudienceImageView?.mas_top)?.offset()(15)
        })
        
        let _ = LBottomContentView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.LBachgroundImageView?.mas_bottom)?.offset()(0)
            make?.left.right().right().equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-5)
        })
        
        let _ = LTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LBottomContentView)?.offset()(20)
            make?.right.equalTo()(self.LBottomContentView)?.offset()(-20)
            make?.top.equalTo()(self.LBottomContentView)?.offset()(5)
            make?.bottom.equalTo()(self.LBottomContentView)?.offset()(-5)
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
