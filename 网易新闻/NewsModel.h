//
//  NewsModel.h
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;


+(instancetype)newmodelWithDict:(NSDictionary *)dict;

//进行下载操作   网络请求
+(void)downloadUrlstr:(NSString *)urlStr uccessBlock:(void(^)(NSArray *arr))successBlock failureBlock:(void(^)(NSError *error))failureBlock;
@end
