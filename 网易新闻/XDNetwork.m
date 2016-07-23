//
//  XDNetwork.m
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "XDNetwork.h"
#import <AFNetworking.h>
@implementation XDNetwork
static id _instancetype;
+(instancetype)sharedXDNetwork{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        _instancetype = [[self alloc]initWithBaseURL:baseUrl];
    });



    return _instancetype;
}
@end
