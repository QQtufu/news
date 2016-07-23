//
//  NewsTableviewCell.h
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsTableviewCell : UITableViewCell
@property (nonatomic, strong) NewsModel * model;
@end
