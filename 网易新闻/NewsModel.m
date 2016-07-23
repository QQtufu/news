//
//  NewsModel.m
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "NewsModel.h"
#import "XDNetwork.h"
@implementation NewsModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{ //什么都不用写
}
+(instancetype)newmodelWithDict:(NSDictionary *)dict{
    NewsModel *model = [[NewsModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];

    return model;
}

+(void)downloadUrlstr:(NSString *)urlStr uccessBlock:(void(^)(NSArray *arr))successBlock failureBlock:(void(^)(NSError *error))failureBlock{
    NSLog(@"#####%@",urlStr);
    [[XDNetwork sharedXDNetwork]GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析好的json数据  为字典  用来接收
//        NSLog(@"responseObject %@",responseObject);
        NSDictionary *dict = responseObject;
        NSString *key = dict.keyEnumerator.nextObject;
//        NSLog(@"key %@",key);
        NSArray *arr = [dict objectForKey:key];
        NSMutableArray *arrM = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NewsModel *model = [self newmodelWithDict:obj];
            [arrM addObject:model];
            if (successBlock) {
                successBlock(arrM.copy);
            }
            
                 }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"newsmodel-- error  %@",error);
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];




}
@end
