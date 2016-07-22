//
//  NSDictionary+property.m
//  Runtime 字典转模型
//
//  Created by 澳蜗科技 on 16/7/22.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

#import "NSDictionary+property.h"

@implementation NSDictionary (property)

//自动生成属性代码
+ (NSString *)creatPropertyWithDict:(NSDictionary *)dict
{
    NSMutableString *newStr = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {

        if([value isKindOfClass:[NSDictionary class]]){
            [newStr appendFormat:@"@property (nonatomic,strong) NSDictionary *%@;\n",key];
        }else if([value isKindOfClass:[NSString class]]){
            [newStr appendFormat:@"@property (nonatomic,strong) NSString *%@;\n",key];
        }else if([value isKindOfClass:[NSArray class]]){
            [newStr appendFormat:@"@property (nonatomic,strong) NSArray *%@;\n",key];
        }else if([NSStringFromClass([value class]) isEqualToString:@"__NSCFBoolean"]){
            [newStr appendFormat:@"@property (nonatomic,assign) BOOL %@;\n",key];
        }else if([value isKindOfClass:[NSNumber class]]){
            [newStr appendFormat:@"@property (nonatomic,assign) NSInteger %@;\n",key];
        }
    }];
    NSLog(@"%@",newStr);
    return newStr;
}

@end
