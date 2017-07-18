//
//  ETTLiveCell.swift
//  QQNews
//
//  Created by WangJunZi on 2017/7/12.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit
import Masonry
import SDWebImage

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
    
    //精选
    var choiceLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = choiceLiveModel?.title
            LSourceLabel?.text = choiceLiveModel?.source
            
            if choiceLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (choiceLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (choiceLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if choiceLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if choiceLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (choiceLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if choiceLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (choiceLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //资讯
    var informationLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = informationLiveModel?.title
            LSourceLabel?.text = informationLiveModel?.source
            
            if informationLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (informationLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (informationLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if informationLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if informationLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (informationLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if informationLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (informationLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //文艺
    var literatureLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = literatureLiveModel?.title
            LSourceLabel?.text = literatureLiveModel?.source
            
            if literatureLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (literatureLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (literatureLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if literatureLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if literatureLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (literatureLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if literatureLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (literatureLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //娱乐
    var entertainmentLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = entertainmentLiveModel?.title
            LSourceLabel?.text = entertainmentLiveModel?.source
            
            if entertainmentLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (entertainmentLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (entertainmentLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if entertainmentLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if entertainmentLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (entertainmentLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if entertainmentLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (entertainmentLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //财经
    var financeLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = financeLiveModel?.title
            LSourceLabel?.text = financeLiveModel?.source
            
            if financeLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (financeLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (financeLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if financeLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if financeLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (financeLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if financeLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (financeLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //电视台
    var TVStationLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = TVStationLiveModel?.title
            LSourceLabel?.text = TVStationLiveModel?.source
            
            if TVStationLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (TVStationLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (TVStationLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if TVStationLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if TVStationLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (TVStationLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if TVStationLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (TVStationLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //体育
    var sportLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = sportLiveModel?.title
            LSourceLabel?.text = sportLiveModel?.source
            
            if sportLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (sportLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (sportLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if sportLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if sportLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (sportLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if sportLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (sportLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //慢视界
    var slowHorizonLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = slowHorizonLiveModel?.title
            LSourceLabel?.text = slowHorizonLiveModel?.source
            
            if slowHorizonLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (slowHorizonLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (slowHorizonLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if slowHorizonLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if slowHorizonLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (slowHorizonLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if slowHorizonLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (slowHorizonLiveModel?.live_info?.up_num)!)
            }
            LHotNumLabel?.sizeToFit()
            
        }
    }
    
    //生活
    var lifeLiveModel:ETTLiveModel?
    {
        didSet
        {
            LTitleLabel?.text = lifeLiveModel?.title
            LSourceLabel?.text = lifeLiveModel?.source
            
            if lifeLiveModel?.bigImageString == nil
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (lifeLiveModel?.thumbnailsString)!), placeholderImage: kImage(named: "qq_placeholder"))
            } else
            {
                LBachgroundImageView?.sd_setImage(with: URL.init(string: (lifeLiveModel?.bigImageString)!), placeholderImage: kImage(named: "qq_placeholder"))
            }
            
            if lifeLiveModel?.is_live == 1
            {
                LLiveImageView?.isHidden = false
            } else
            {
                LLiveImageView?.isHidden = true
            }
            
            if lifeLiveModel?.live_info?.online_total == 0
            {
                LAudienceNumLabel?.text = String(format: "%d", kRandowNum())
            } else
            {
                
                LAudienceNumLabel?.text = String(format: "%d", (lifeLiveModel?.live_info?.online_total)!)
            }
            LAudienceNumLabel?.sizeToFit()
            
            if lifeLiveModel?.live_info?.up_num == 0
            {
                LHotNumLabel?.text = String(format: "%d", kRandowNum())
            }else
            {
                LHotNumLabel?.text = String(format: "%d", (lifeLiveModel?.live_info?.up_num)!)
            }
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
        LBachgroundImageView = UIImageView()
        LBachgroundImageView?.isUserInteractionEnabled = true
        self.contentView.addSubview(LBachgroundImageView!)
        
        //直
        LLiveImageView = UIImageView()
        LLiveImageView?.isUserInteractionEnabled = true
        LLiveImageView?.image = kImage(named: "live_video_detail_icon_vcr")
        LBachgroundImageView?.addSubview(LLiveImageView!)
        
        //头像
        LAudienceImageView = UIImageView()
        LAudienceImageView?.isUserInteractionEnabled = true
        LAudienceImageView?.image = kImage(named: "night-livepage_icon_num")
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
        LHotImageView?.image = kImage(named: "night-livepage_icon_zan")
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
        LBottomContentView?.backgroundColor = kColor(r: 246, g: 246, b: 246)
        self.contentView.addSubview(LBottomContentView!)
        
        //来源
        LSourceLabel = UILabel()
        LSourceLabel?.textAlignment = NSTextAlignment.left
        LSourceLabel?.font = UIFont.systemFont(ofSize: 15.0)
        LSourceLabel?.textColor = UIColor.lightGray
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
                make?.width.equalTo()(15)
                make?.bottom.equalTo()(self.LBachgroundImageView?.mas_bottom)?.offset()(-22.5)
            })
            
        } else
        {
            let _ = LAudienceImageView?.mas_makeConstraints({ (make) in
                make?.left.equalTo()(self.LBachgroundImageView)?.offset()(20)
                make?.bottom.equalTo()(self.LBachgroundImageView)?.offset()(-22.5)
                make?.height.equalTo()(15)
                make?.width.equalTo()(15)
            })
        }
        
        let _ = LAudienceNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LAudienceImageView?.mas_right)?.offset()(5)
            make?.height.equalTo()(self.LAudienceImageView)
            make?.bottom.equalTo()(self.LAudienceImageView)
        })
        
        let _ = LHotImageView?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LAudienceNumLabel?.mas_right)?.offset()(20)
            make?.bottom.equalTo()(self.LBachgroundImageView)?.offset()(-22.5)
            make?.height.equalTo()(15)
            make?.width.equalTo()(15)
        })
        
        let _ = LHotNumLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LHotImageView?.mas_right)?.offset()(5)
            make?.height.bottom().equalTo()(self.LAudienceNumLabel)
        })
        
        let _ = LTitleLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LBachgroundImageView)?.offset()(20)
            make?.right.equalTo()(self.LBachgroundImageView)?.offset()(-20)
            make?.height.equalTo()(30)
            make?.bottom.equalTo()(self.LAudienceImageView?.mas_top)?.offset()(-10)
        })
        
        let _ = LBottomContentView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.LBachgroundImageView?.mas_bottom)?.offset()(0)
            make?.left.right().right().equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-5)
        })
        
        let _ = LSourceLabel?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.LBottomContentView)?.offset()(20)
            make?.right.equalTo()(self.LBottomContentView?.mas_right)?.offset()(-20)
            make?.top.equalTo()(self.LBottomContentView)?.offset()(5)
            make?.bottom.equalTo()(self.LBottomContentView?.mas_bottom)?.offset()(-5)
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
