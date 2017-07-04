//
//  ETTMacro.swift
//  QQNews
//
//  Created by LiuChuanan on 2017/6/15.
//  Copyright © 2017年 waitWalker. All rights reserved.
//
/*
     宏定义
 */
import UIKit

/// 颜色
func kETTColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0);
}

func kRandomColor() -> UIColor
{
    let color = UIColor.init(red:CGFloat(arc4random_uniform(255))/CGFloat(255.0), green:CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue:CGFloat(arc4random_uniform(255))/CGFloat(255.0) , alpha: 1)
    return color;
}

func kRandowNum()->Int
{
    let randomNum:Int = Int(arc4random_uniform(10000))
    return randomNum
}

func kImage(named:String) -> UIImage 
{
    let image:UIImage = UIImage(named: named)!
    return image
    
}
