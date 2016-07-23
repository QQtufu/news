//
//  ChannelLabel.m
//  网易新闻
//
//  Created by iMac on 16/7/22.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
    }


    return self;
}

@end
