//
//  CycleModel.m
//  网易新闻
//
//  Created by iMac on 16/7/21.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "CycleModel.h"
#import "XDNetwork.h"
@implementation CycleModel
+(instancetype)cycleModelWithDict:(NSDictionary *)dict{
    CycleModel *model = [[CycleModel alloc]init];
    //kvc
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//什么都不用写,因为部分key 未定义  此方法防止崩溃
}
+(void)loadCycleModel:(NSString *)urlStr successBlock:(void(^)(NSArray *arr))successBlock failBlock:(void(^)(NSError *error))failBlock{
    //调用下载方法
    [[XDNetwork sharedXDNetwork]GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        NSString *key = responseObject.keyEnumerator.nextObject;
        
        NSArray *arr = responseObject[key];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        //遍历
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //字典转模型
            CycleModel *model = [CycleModel cycleModelWithDict:obj];
            [arrM addObject:model];
            
        }];
        
        //回调
        if (successBlock) {
            successBlock(arrM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(error);
        }
        
    }];
    



}
@end
