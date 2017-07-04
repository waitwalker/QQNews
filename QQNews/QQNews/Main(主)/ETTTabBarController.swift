//
//  ETTTabBarController.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//

import UIKit

class ETTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildViewControllers();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 初始化子控制器          
    ///
    /// - Parameters:
    ///   - childVC: 子控制器
    ///   - title: tabbar上标题
    ///   - normalImage: 正常图片
    ///   - selectedImage: 选中图片
    func setupTabBar(childVC:UIViewController,title:String,normalImage:String,selectedImage:String) -> Void 
    {
        
        childVC.tabBarItem.title = title;
        childVC.tabBarItem.image = UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal);
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal);
        let normalDict = NSDictionary(object: UIColor.init(red: 40.0, green: 40.0, blue: 40.0, alpha: 1.0), forKey: kCTForegroundColorAttributeName as! NSCopying)
        
        childVC.tabBarItem.setTitleTextAttributes(normalDict as? [NSAttributedStringKey : Any], for: .normal);
        let selectedDict = NSDictionary(object: UIColor.init(red: 31.0, green: 123.0, blue: 212.0, alpha: 1.0), forKey: kCTForegroundColorAttributeName as! NSCopying);
        childVC.tabBarItem.setTitleTextAttributes(selectedDict as? [NSAttributedStringKey : Any], for: .selected)
        let navigationController = ETTNavigationController(rootViewController: childVC);
        self.addChildViewController(navigationController);
    }
    
    
    /// 添加子控制器
    func addChildViewControllers() -> Void 
    {
        
        let newsVC = ETTNewsViewController();
        self.setupTabBar(childVC: newsVC, title: "新闻", normalImage: "tabbar_news_normal", selectedImage: "tabbar_news_selected");
        
        let recommendVC = ETTRecommendViewController();
        self.setupTabBar(childVC: recommendVC, title: "推荐", normalImage: "tabbar_recommend_normal", selectedImage: "tabbar_recommend_selected");
        
        let liveVC = ETTLiveViewController();
        self.setupTabBar(childVC: liveVC, title: "直播", normalImage: "tabbar_live_normal", selectedImage: "tabbar_live_selected");
        
        let meVC = ETTMeViewController();
        self.setupTabBar(childVC: meVC, title: "我", normalImage: "tabbar_me_normal", selectedImage: "tabbar_me_selected");
        
    }


}
