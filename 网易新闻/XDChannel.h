//
//  XDChannel.h
//  网易新闻
//
//  Created by iMac on 16/7/19.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDChannel : NSObject

+ (NSArray *)channels;

@property (copy ,nonatomic) NSString *tname;
@property (nonatomic, copy) NSString * tid;

+(instancetype)channelWithDict:(NSDictionary *)dict;
@end
