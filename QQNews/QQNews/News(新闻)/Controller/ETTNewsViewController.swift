//
//  ETTNewsViewController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTNewsViewController: ETTViewController,UIScrollViewDelegate {
    
    var importNewsVC = ETTImportNewsViewController();
    
    var videoNewsVC = ETTVideoNewsViewController();
    
    
    // MARK: - 属性变量
    var titleScrollView:UIScrollView?
    var middleScrollView:UIScrollView?
    var lineView:UIView?
    
    
    let kButtonWidth:CGFloat = 50.0;
    let kSelectedButtonTitleFontSize:CGFloat = 20.0;
    let kNormalButtonTitleFontSize:CGFloat = 18.0;
    let kSelectedButtonTitleColor:UIColor = kETTColor(r: 0, g: 0, b: 0);
    let kNormalButtonTitleColor:UIColor = kETTColor(r: 127, g: 127, b: 127);
    let kLineViewBackgroundColor:UIColor = kETTColor(r: 0, g: 103, b: 208);
    
    
    
    
    var buttonArray:NSMutableArray = []
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
    
    // MARK: - 初始化子控件
    func setupSubviews() -> Void
    {
        setupTopViews();
        setupMiddleViews();
    }
    
    // MARK: - 设置顶部titleView
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
        
        
        titleArray = NSArray(objects: "要闻","视频");
        //NSArray(objects: "要闻","视频","北京","NBA","科技","军事","社会","财经","娱乐","房产");
        
        titleScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: titleContentView.frame.size.width, height: 44));
        titleScrollView?.contentSize = CGSize.init(width: CGFloat((titleArray.count)) * kButtonWidth, height: 0);
        titleScrollView?.isScrollEnabled = true;
        titleScrollView?.isPagingEnabled = true;
        titleScrollView?.showsHorizontalScrollIndicator = false;
        self.navigationItem.titleView = titleScrollView;
        
        lineView = UIView(frame: CGRect(x: 0, y: 42, width: kButtonWidth, height: 2));
        lineView?.backgroundColor = kLineViewBackgroundColor;
        titleScrollView?.addSubview(lineView!);
        
        buttonArray = NSMutableArray();
        
        for index in 0...(titleArray.count - 1) {
            
            print(titleArray[index])
            let buttonX:CGFloat = CGFloat(index) * kButtonWidth;
            let buttonY:CGFloat = 0;
            let buttonWidth:CGFloat = kButtonWidth;
            let buttonHeight:CGFloat = 40.0;
            let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight));
            button.setTitle(titleArray[index] as? String, for: UIControlState.normal);
            button.setTitleColor(kSelectedButtonTitleColor, for: UIControlState.selected);
            button.setTitleColor(kNormalButtonTitleColor, for: UIControlState.normal);
            button.tag = index;
            button.addTarget(self, action: #selector(buttonAction(button:)), for: UIControlEvents.touchUpInside);
            button.titleLabel?.font = UIFont.systemFont(ofSize: kSelectedButtonTitleFontSize);
            titleScrollView?.addSubview(button);
            buttonArray.add(button);
        }
        
    }
    
    // MARK: - 顶部titleView按钮的点击事件回调
    @objc func buttonAction(button:UIButton) -> Void
    {
        button.isSelected = true;
        let subviews = middleScrollView?.subviews[button.tag];
        middleScrollView?.contentOffset = CGPoint(x: (subviews?.frame.origin.x)!, y: (subviews?.frame.origin.y)!);
        for index in 0...(buttonArray.count - 1) {
            let tempButton:UIButton = buttonArray[index] as! UIButton;
            if tempButton.tag != button.tag
            {
                tempButton.isSelected = false;
            }
        }
        
    }
    
    // MARK: - 初始化中间部分
    func setupMiddleViews() -> Void
    {
        middleScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
        middleScrollView?.contentSize = CGSize(width: CGFloat(self.titleArray.count) * kScreenWidth, height: 0);
        middleScrollView?.isPagingEnabled = true;
        middleScrollView?.delegate = self;
        middleScrollView?.bounces = false;
        middleScrollView?.showsHorizontalScrollIndicator = false;
        
        self.view.addSubview(middleScrollView!);
        
        for index in 0...(titleArray.count - 1) {
            let subviews = UIView(frame: CGRect(x: kScreenWidth * CGFloat(index), y: 0, width: kScreenWidth, height: kScreenHeight));
            subviews.backgroundColor = kRandomColor();
            middleScrollView?.addSubview(subviews);
        }
        self.addSubviewsInMiddleScrollView();
    }
    
    // MARK: - 添加中间部分子视图
    func addSubviewsInMiddleScrollView() -> Void
    {
        for index in 0...(titleArray.count - 1) {
            switch index
            {
            case 0:
                do {
                    let subview = middleScrollView?.subviews[index];
                    
                    importNewsVC.view.frame = (subview!.bounds);
                    
                    subview?.addSubview(importNewsVC.view);
                }
                
                break;
            case 1:
               do {
                let subview = middleScrollView?.subviews[index];
                
                videoNewsVC.view.frame = (subview!.bounds);
                
                subview?.addSubview(videoNewsVC.view);
            }
                break;
//            case 2:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 3:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 4:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 5:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 6:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 7:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 8:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
//            case 9:
//                let subview = middleScrollView?.subviews[index];
//                let neededView = ETTVideoNewsView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
//                neededView.backgroundColor = UIColor.yellow;
//                //subview?.addSubview(neededView);
//                break;
                
            default :
                break;
                
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == middleScrollView 
        {
            let pageIndex:Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
            for index in 0...((buttonArray.count) - 1) {
                
                if index == pageIndex
                {
                    let button:UIButton = buttonArray[index] as! UIButton;
                    button.isSelected = true;
                    button.titleLabel?.font = UIFont.systemFont(ofSize: kSelectedButtonTitleFontSize);
                    
                    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                        
                        var lineViewFrame = self.lineView?.frame;
                        lineViewFrame?.origin.x = button.frame.origin.x;
                        self.lineView?.frame = lineViewFrame!;
                        
                        let toRight:CGFloat = button.frame.origin.x + button.frame.size.width;
                        let toLeft:CGFloat = button.frame.origin.x;
                        let minX:CGFloat = (self.titleScrollView?.contentOffset.x)!;
                        let maxX:CGFloat = (self.titleScrollView?.contentOffset.x)! + (self.titleScrollView?.frame.size.width)!;
                        if toRight > maxX
                        {
                            self.titleScrollView?.setContentOffset(CGPoint(x: self.titleScrollView!.contentOffset.x + (toRight - maxX), y: self.titleScrollView!.contentOffset.y), animated: true);
                        }
                        
                        if toLeft < minX
                        {
                            self.titleScrollView?.setContentOffset(CGPoint(x: (self.titleScrollView?.contentOffset.x)! + (toLeft - minX), y: (self.titleScrollView?.contentOffset.y)!), animated: true);
                        }
                        
                    }, completion: { (finished) in
                        
                    })
                    
                } else
                {
                    let button:UIButton = buttonArray[index] as! UIButton;
                    button.isSelected = false;
                    button.titleLabel?.font = UIFont.systemFont(ofSize: kNormalButtonTitleFontSize);
                }
            }
        } else if scrollView .isKind(of: UITableView.self)
        {
            return;
        }
        
    }
}
