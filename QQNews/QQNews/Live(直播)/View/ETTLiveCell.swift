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
        
        self.contentView.backgroundColor = UIColor.lightGray
        LBachgroundImageView = UIImageView()
        LBachgroundImageView?.isUserInteractionEnabled = true
        LBachgroundImageView?.backgroundColor = kRandomColor()
        self.contentView.addSubview(LBachgroundImageView!)
        
        LBottomContentView = UIView()
        LBottomContentView?.backgroundColor = UIColor.white
        self.contentView.addSubview(LBottomContentView!)
        
        LSourceLabel = UILabel()
        LSourceLabel?.text
        
    }
    
    func layoutSubview() -> Void
    {
        let _ = LBachgroundImageView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.left.right().equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-50)
        })
        
        let _ = LBottomContentView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.LBachgroundImageView?.mas_bottom)?.offset()(0)
            make?.left.right().right().equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-5)
        })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
