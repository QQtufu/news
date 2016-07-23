//
//  XDNetwork.h
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface XDNetwork : AFHTTPSessionManager
+(instancetype)sharedXDNetwork;
@end
