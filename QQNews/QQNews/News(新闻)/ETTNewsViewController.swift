//
//  ETTNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTNewsViewController: ETTViewController,UIScrollViewDelegate {
    
    var titleScrollView:UIScrollView?
    var middleScrollView:UIScrollView?
    
    let kButtonWidth:CGFloat = 60.0;
    var buttonArray:NSMutableArray?
    var titleArray:NSArray = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        NSLog("屏幕frame: %@", NSStringFromCGRect(self.view.frame));
        
        
        self.setupSubviews();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSubviews() -> Void
    {
        setupTopViews();
        setupMiddleViews();
    }
    
    func setupTopViews() -> Void
    {
        let searchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 44));
        searchImageView.backgroundColor = UIColor.red;
        searchImageView.isUserInteractionEnabled = true;
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: searchImageView);
        
        let addItemImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 44));
        addItemImageView.backgroundColor = UIColor.red;
        addItemImageView.isUserInteractionEnabled = true;
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: addItemImageView);
        
        let titleContentView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 30 * 2 - 30 * 2, height: 44));
        titleContentView.backgroundColor = UIColor.purple;
        self.navigationItem.titleView = titleContentView;
        
        titleArray = NSArray(objects: "要闻","视频","北京","NBA","科技","军事","社会","财经","娱乐");
        
        titleScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: titleContentView.frame.size.width, height: 44));
        titleScrollView?.contentSize = CGSize.init(width: CGFloat((titleArray.count)) * kButtonWidth, height: 0);
        titleScrollView?.backgroundColor = UIColor.green;
        titleContentView.addSubview(titleScrollView!);
        
        let lineView = UIView(frame: CGRect(x: 0, y: 42, width: kButtonWidth, height: 2));
        lineView.backgroundColor = UIColor.orange;
        titleScrollView?.addSubview(lineView);
        
        buttonArray = NSMutableArray();
        
        for index in 0...(titleArray.count - 1) {
            
            print(titleArray[index])
            let buttonX:CGFloat = CGFloat(index) * kButtonWidth;
            let buttonY:CGFloat = 0;
            let buttonWidth:CGFloat = kButtonWidth;
            let buttonHeight:CGFloat = 40.0;
            let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight));
            button.setTitle(titleArray[index] as? String, for: UIControlState.normal);
            button.setTitleColor(UIColor.red, for: UIControlState.selected);
            button.setTitleColor(UIColor.black, for: UIControlState.normal);
            button.tag = index;
            button.addTarget(self, action: #selector(buttonAction(button:)), for: UIControlEvents.touchUpInside);
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0);
            titleScrollView?.addSubview(button);
            buttonArray?.add(button);
        }
        
    }
    
    @objc func buttonAction(button:UIButton) -> Void
    {
        
    }
    
    func setupMiddleViews() -> Void
    {
        middleScrollView = UIScrollView(frame: CGRect(x: 0, y: 2, width: kScreenWidth, height: kScreenHeight - 2));
        middleScrollView?.contentSize = CGSize(width: CGFloat(self.titleArray.count) * kScreenWidth, height: kScreenHeight - 2);
        middleScrollView?.isPagingEnabled = true;
        middleScrollView?.delegate = self;
        middleScrollView?.bounces = false;
        self.view.addSubview(middleScrollView!);
        
        for index in 0...(titleArray.count - 1) {
            let subviews = UIView(frame: CGRect(x: kScreenWidth * CGFloat(index), y: 2, width: kScreenWidth, height: kScreenHeight - 2));
            subviews.backgroundColor = kRandomColor();
            middleScrollView?.addSubview(subviews);
        }
        
    }
    
    func addSubviewsInMiddleScrollView() -> Void
    {
        for index in 0...(titleArray.count - 1) {
            switch index
            {
            case 0:
                
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
            case 5:
                
                break;
            case 6:
                
                break;
            default :
                break;
                
            }
        }
    }
    

}
