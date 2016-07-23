//
//  XDChannel.m
//  网易新闻
//
//  Created by iMac on 16/7/19.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "XDChannel.h"

@implementation XDChannel
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@",_tid,_tname];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+(instancetype)channelWithDict:(NSDictionary *)dict{
    XDChannel *model = [[XDChannel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (NSArray *)channels
{

    //加载json
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    

    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //反序列化
    
    NSDictionary *d = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *arr = d[@"tList"];
    
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:arr.count];
    
    //遍历数组  进行字典转模型
    
    for (NSDictionary * dict in arr) {
        
        //创建模型  进行转换
        
        XDChannel *channel = [XDChannel channelWithDict:dict];
        
       
        
        [temp addObject:channel];
    }
   [temp sortUsingComparator:^NSComparisonResult(XDChannel  * obj1, XDChannel  * obj2) {
       
       
       return [obj1.tid compare:obj2.tid];
   }];
    
    return temp.copy;
}

@end
