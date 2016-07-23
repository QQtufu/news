//
//  CycleCollectionViewCell.m
//  网易新闻
//
//  Created by iMac on 16/7/21.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import "CycleModel.h"
#import "UIImageView+WebCache.h"
@interface CycleCollectionViewCell ()
@property (nonatomic, weak)IBOutlet UIImageView * cycleImageView;
@property (nonatomic, weak)IBOutlet UILabel * titleLabel;
@end

@implementation CycleCollectionViewCell



-(void)setModel:(CycleModel *)model{
    _model = model;
    [self.cycleImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.titleLabel.text = model.title;


}


@end
