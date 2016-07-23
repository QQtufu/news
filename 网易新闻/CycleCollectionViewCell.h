//
//  CycleCollectionViewCell.h
//  网易新闻
//
//  Created by iMac on 16/7/21.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CycleModel;
@interface CycleCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) CycleModel * model;
@end
