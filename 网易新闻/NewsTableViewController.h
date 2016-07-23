//
//  NewsTableViewController.h
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewController : UITableViewController
//接受cell传过来的  urlStr
@property (nonatomic, copy) NSString * urlStr;
@end
