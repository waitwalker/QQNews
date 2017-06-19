//
//  ETTMeHeaderCell.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/19.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTMeHeaderCell: ETTTableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews();
    }
    
    func setupSubviews() -> Void 
    {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
