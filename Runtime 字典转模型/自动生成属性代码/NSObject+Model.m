//
//  NSObject+Model.m
//  Runtime 字典转模型
//
//  Created by 澳蜗科技 on 16/7/22.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

/*
    打开runtime机制：building setting -> 搜索msg -> Enable Strict Checking of objc_msgSend Calls ->Yes
 */

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    
    //runtime:根据模型中属性，去字典中取出对应的value给模型属性赋值
    //1.获取模型中所有成员变量  key
    //class：获取哪个类的成员变量
    //Count：成员变量的数量
    unsigned int count = 0;
    //获取成员变量数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    //遍历所有成员变量
    for (NSInteger i=0; i<count; i++) {
        //获取成员变量
        Ivar ivar = ivarList[i];
        //获取成员变量的名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //获取成员变量的类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];

        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];

        //获取key
        NSString *key = [ivarName substringFromIndex:1];
        //去字典中查找对应value
        id value = dict[key];
        
        //二级转换：判断value是否为字典，如果是，字典转换成对应的模型
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            //字典转换成模型
            //转换为哪个模型
            //获取成员变量类型
            //获取类
            Class modelClass = NSClassFromString(ivarType);
            
            value = [modelClass modelWithDict:value];
        }
        
        //给模型中属性赋值
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
