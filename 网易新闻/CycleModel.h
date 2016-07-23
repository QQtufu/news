//
//  CycleModel.h
//  网易新闻
//
//  Created by iMac on 16/7/21.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject
@property (nonatomic, copy) NSString * title;
//图片
@property (nonatomic, copy) NSString * imgsrc;
+(instancetype)cycleModelWithDict:(NSDictionary *)dict;
+(void)loadCycleModel:(NSString *)urlStr successBlock:(void(^)(NSArray *arr))successBlock failBlock:(void(^)(NSError *error))failBlock;
@end
