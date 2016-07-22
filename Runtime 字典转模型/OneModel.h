//
//  OneModel.h
//  Runtime 字典转模型
//
//  Created by 澳蜗科技 on 16/7/22.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoModel.h"

@interface OneModel : NSObject

@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,assign) NSInteger integer;
@property (nonatomic,strong) NSArray *array2;
@property (nonatomic,strong) TwoModel *dict1;
@property (nonatomic,strong) NSString *str1;
@property (nonatomic,assign) BOOL Bool;
@property (nonatomic,strong) NSString *str2;

@end
