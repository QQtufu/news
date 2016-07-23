//
//  XDHomeControllercell.m
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "XDHomeControllercell.h"
#import "NewsTableViewController.h"

@interface XDHomeControllercell ()
@property (nonatomic, strong) NewsTableViewController * newsTabVC;


@end
@implementation XDHomeControllercell
-(void)awakeFromNib{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NewsTableViewController" bundle:nil];
    self.newsTabVC = [storyboard instantiateInitialViewController];
    //设置tableView的frame
    self.newsTabVC.tableView.frame = self.contentView.bounds;
    self.newsTabVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    //把tableView 添加到collectionView中
    [self addSubview:self.newsTabVC.tableView];


}
-(void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    //把urlStr 传给 tableview
    self.newsTabVC.urlStr = urlStr;



}
@end
